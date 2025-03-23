import 'package:flutter/material.dart';

import '../widgets/dialog/quiz_dialog.dart';
import '../widgets/quiz_tile.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          QuizTile(
            title: 'Hiragana',
            subtitle: 'あいうえお',
            onTap: () {
              openChooseQuiz(context);
            },
          ),
          QuizTile(
            title: 'Katakana',
            subtitle: 'アイウエオ',
            onTap: () {
              openChooseQuiz(context, isHiragana: false);
            },
          ),
        ],
      ),
    );
  }
}
