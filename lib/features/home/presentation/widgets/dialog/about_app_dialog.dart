import 'package:flutter/material.dart';

import '../../../../../core/components/base_dialog.dart';
import '../../../../../core/helper/navigator_helper.dart';
import '../../../../../core/helper/subtitle_helper.dart';

void openAboutDialog(String version) {
  final context = globalCurrentContext;
  baseDialog(
    child: Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.of(context)!.aboutApp,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        Text("${S.of(context)!.currentVersion} : $version"),
        const Text("Aplikasi ngide aja ini bang, nanti desc nya diganti")
      ],
    ),
  );
}
