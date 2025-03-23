import 'package:flutter/material.dart';

import '../../../../core/components/base_dialog.dart';
import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/helper/subtitle_helper.dart';

void showWarning(String totalWrong) {
  baseDialog(
    barrierDismissible: false,
    child: Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${S.of(globalCurrentContext)!.incorrectAnswer}: $totalWrong",
          style: Theme.of(globalCurrentContext)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(S.of(globalCurrentContext)!.letsFixYourAnswer),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(globalCurrentContext);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(S.of(globalCurrentContext)!.letsgo),
        )
      ],
    ),
  );
}
