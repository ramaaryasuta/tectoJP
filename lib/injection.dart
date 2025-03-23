import 'package:get_it/get_it.dart';

import 'features/home/presentation/cubit/locale_cubit.dart';
import 'features/quiz/data/datasource/hiragana_datasource.dart';
import 'features/quiz/data/datasource/katakana_datasource.dart';
import 'features/quiz/data/repositories/hiragana_quiz_repository.dart';
import 'features/quiz/domain/repositories/kana_quiz_repository.dart';
import 'features/quiz/domain/usecase/get_combine_kana.dart';
import 'features/quiz/domain/usecase/get_dakuten_kana.dart';
import 'features/quiz/domain/usecase/get_main_kana.dart';
import 'features/quiz/presentation/cubit/quiz_cubit.dart';

var myInjection = GetIt.instance;

Future<void> initInjection() async {
  // Locale
  myInjection.registerFactory<LocaleCubit>(() => LocaleCubit());

  // FEATURE - Quiz
  // Cubit
  myInjection.registerFactory<QuizCubit>(() => QuizCubit(
        myInjection(),
        myInjection(),
        myInjection(),
      ));

  // Use Case
  myInjection.registerFactory<GetMainKana>(() => GetMainKana(myInjection()));
  myInjection
      .registerFactory<GetDakutenKana>(() => GetDakutenKana(myInjection()));
  myInjection
      .registerFactory<GetCombineKana>(() => GetCombineKana(myInjection()));

  // Repository
  myInjection.registerFactory<KanaQuizRepository>(() => KanaQuizRepositoryImpl(
        hiraganaDataSource: myInjection(),
        katakanaDataSource: myInjection(),
      ));

  // Data Source
  myInjection
      .registerFactory<HiraganaDataSource>(() => HiraganaDataSourceImpl());
  myInjection
      .registerFactory<KatakanaDataSource>(() => KatakanaDataSourceImpl());
}
