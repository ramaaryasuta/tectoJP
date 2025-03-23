import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_dialog.dart';
import '../../../../../core/helper/navigator_helper.dart';
import '../../../../../core/helper/subtitle_helper.dart';
import '../../../../../router/app_router.gr.dart';
import '../../../../quiz/presentation/cubit/quiz_cubit.dart';

void openKanaChooseQuiz(BuildContext context, {bool isHiragana = true}) {
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
        TileTypeQuiz(
          title: "Main $title",
          trailing: isHiragana ? "あ" : "ア",
          kanaType: isHiragana ? KanaType.hiragana : KanaType.katakana,
          quizType: QuizType.main,
        ),
        TileTypeQuiz(
          title: "Dakuten $title",
          trailing: isHiragana ? "が" : "ガ",
          kanaType: isHiragana ? KanaType.hiragana : KanaType.katakana,
          quizType: QuizType.dakuten,
        ),
        TileTypeQuiz(
          title: "${S.of(globalCurrentContext)!.combination} $title",
          trailing: isHiragana ? "しゃ" : "シャ",
          kanaType: isHiragana ? KanaType.hiragana : KanaType.katakana,
          quizType: QuizType.combine,
        ),
        TileTypeQuiz(
          title: "${S.of(globalCurrentContext)!.all} $title",
          trailing: isHiragana ? "しゃが" : "シャガ",
          kanaType: isHiragana ? KanaType.hiragana : KanaType.katakana,
          quizType: QuizType.all,
        ),
      ],
    ),
  );
}

class TileTypeQuiz extends StatelessWidget {
  const TileTypeQuiz({
    super.key,
    required this.title,
    required this.trailing,
    required this.kanaType,
    required this.quizType,
  });

  final String title;
  final String trailing;
  final KanaType kanaType;
  final QuizType quizType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        context.router.push(
          QuizRoute(kanaType: kanaType, quizType: quizType),
        );
      },
      tileColor: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(title,
          style: Theme.of(globalCurrentContext).textTheme.bodyMedium),
      trailing: Text(trailing,
          style: Theme.of(globalCurrentContext)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
