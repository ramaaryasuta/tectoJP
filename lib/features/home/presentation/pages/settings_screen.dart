import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/helper/subtitle_helper.dart';
import '../widgets/dialog/about_app_dialog.dart';
import '../widgets/dialog/change_language_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<String> _loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "v${packageInfo.version} (${packageInfo.buildNumber})";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            onTap: () {
              changeLanguageDialog(context);
            },
            leading: const Icon(Icons.language_rounded),
            title: Text(S.of(context)!.language),
            subtitle: Text(S.of(context)!.changeLanguage),
          ),
          FutureBuilder<String>(
            future: _loadVersion(),
            builder: (context, snapshot) {
              String versionText = "Loading...";
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                versionText = snapshot.data!;
              }
              return ListTile(
                onTap: () {
                  openAboutDialog(versionText);
                },
                leading: const Icon(Icons.info_outlined),
                title: Text(S.of(context)!.aboutApp),
                subtitle: Text(versionText),
              );
            },
          ),
        ],
      ),
    );
  }
}
