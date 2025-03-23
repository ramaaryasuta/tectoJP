import 'package:flutter/material.dart';

import '../../../../core/helper/subtitle_helper.dart';
import '../../../../core/utils/fonts.dart';

class QuizTile extends StatelessWidget {
  const QuizTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: onTap,
        title: Text('$title ${S.of(context)!.quiz}',
            style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: MyFonts.notoSansJp,
                )),
        trailing: const Icon(Icons.timer_sharp),
      ),
    );
  }
}
