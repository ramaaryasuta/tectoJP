import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/base_dialog.dart';
import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/helper/subtitle_helper.dart';

void showResultQuiz({
  required String score,
  required String finishTime,
}) {
  baseDialog(
    barrierDismissible: false,
    child: Column(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.of(globalCurrentContext)!.result,
            style: Theme.of(globalCurrentContext)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        Text(score),
        const SizedBox(height: 5),
        Text(S.of(globalCurrentContext)!.timeYouFinishAllQuestion,
            style: Theme.of(globalCurrentContext)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        Text(finishTime),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(globalCurrentContext).removeCurrentSnackBar();
            globalCurrentContext.router.back();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(S.of(globalCurrentContext)!.backToHome),
        )
      ],
    ),
  );
}
