// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:tectojp/features/home/presentation/pages/home_page.dart' as _i1;
import 'package:tectojp/features/quiz/presentation/cubit/quiz_cubit.dart'
    as _i5;
import 'package:tectojp/features/quiz/presentation/pages/quiz_page.dart' as _i2;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.QuizPage]
class QuizRoute extends _i3.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i4.Key? key,
    required _i5.KanaType kanaType,
    required _i5.QuizType quizType,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         QuizRoute.name,
         args: QuizRouteArgs(key: key, kanaType: kanaType, quizType: quizType),
         initialChildren: children,
       );

  static const String name = 'QuizRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteArgs>();
      return _i2.QuizPage(
        key: args.key,
        kanaType: args.kanaType,
        quizType: args.quizType,
      );
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({
    this.key,
    required this.kanaType,
    required this.quizType,
  });

  final _i4.Key? key;

  final _i5.KanaType kanaType;

  final _i5.QuizType quizType;

  @override
  String toString() {
    return 'QuizRouteArgs{key: $key, kanaType: $kanaType, quizType: $quizType}';
  }
}
