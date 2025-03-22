import 'package:flutter/material.dart';

import '../../../../core/helper/subtitle_helper.dart';
import '../../../../core/utils/fonts.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text('Hiragana ${S.of(context)!.quiz}',
                  style: Theme.of(context).textTheme.titleSmall),
              subtitle: Text('あいうえお',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: MyFonts.notoSansJp,
                      )),
              trailing: const Icon(Icons.timer_sharp),
            ),
          )
        ],
      ),
    );
  }
}
