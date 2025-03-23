import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_dialog.dart';
import '../../../../../core/helper/navigator_helper.dart';
import '../../../../../core/helper/subtitle_helper.dart';
import '../../../../../router/app_router.gr.dart';

void openChooseQuiz(BuildContext context, {bool isHiragana = true}) {
  final String title = isHiragana ? "Hiragana" : "Katakana";

  baseDialog(
    child: Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${S.of(globalCurrentContext)!.chooseType} $title",
            style: Theme.of(globalCurrentContext)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            context.router.push(const QuizRoute());
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("Main $title",
              style: Theme.of(globalCurrentContext).textTheme.bodyMedium),
          trailing: Text(isHiragana ? "あ" : "ア",
              style: Theme.of(globalCurrentContext)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            context.router.push(const QuizRoute());
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("Dakuten $title",
              style: Theme.of(globalCurrentContext).textTheme.bodyMedium),
          trailing: Text(isHiragana ? "か" : "カ",
              style: Theme.of(globalCurrentContext)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            context.router.push(const QuizRoute());
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("${S.of(globalCurrentContext)!.combination} $title",
              style: Theme.of(globalCurrentContext).textTheme.bodyMedium),
          trailing: Text(isHiragana ? "しゃ" : "シャ",
              style: Theme.of(globalCurrentContext)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
