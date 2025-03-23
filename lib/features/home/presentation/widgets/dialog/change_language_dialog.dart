import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/components/base_dialog.dart';
import '../../../../../core/helper/navigator_helper.dart';
import '../../../../../core/helper/subtitle_helper.dart';
import '../../cubit/locale_cubit.dart';

void changeLanguageDialog(BuildContext context) {
  final List<Map<String, String>> language = [
    {'name': 'English', 'code': 'en'},
    {'name': 'Indonesia', 'code': 'id'},
    {'name': '日本語', 'code': 'ja'},
  ];

  baseDialog(
    child: Column(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.of(context)!.changeLanguage,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        ListView.builder(
          shrinkWrap: true,
          itemCount: AppLocalizations.supportedLocales.length,
          itemBuilder: (context, index) {
            final locale = AppLocalizations.supportedLocales[index];
            var isActive = locale.languageCode ==
                globalCurrentContext.read<LocaleCubit>().state.languageCode;
            return Container(
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : null,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                tileColor: isActive ? Colors.blue : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                    "${language[index]['name']} (${locale.languageCode})",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: isActive ? Colors.white : null)),
                trailing: isActive
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
                onTap: () {
                  globalCurrentContext
                      .read<LocaleCubit>()
                      .changeLocale(locale.languageCode);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}
