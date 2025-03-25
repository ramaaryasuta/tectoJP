import 'package:get_it/get_it.dart';

import '../../features/quiz/data/datasource/hiragana_datasource.dart';
import '../../features/quiz/data/datasource/katakana_datasource.dart';
import '../../features/quiz/data/repositories/hiragana_quiz_repository.dart';
import '../../features/quiz/domain/repositories/kana_quiz_repository.dart';
import '../../features/quiz/domain/usecase/get_kana.dart';
import '../../features/quiz/presentation/cubit/quiz_cubit.dart';

void quizInjection(GetIt appInjection) {
  // cubit
  appInjection.registerFactory<QuizCubit>(() => QuizCubit(
        appInjection(),
        appInjection(),
        appInjection(),
      ));

  // Use Case
  appInjection.registerFactory<GetMainKana>(() => GetMainKana(appInjection()));
  appInjection
      .registerFactory<GetDakuonKana>(() => GetDakuonKana(appInjection()));
  appInjection
      .registerFactory<GetCombineKana>(() => GetCombineKana(appInjection()));

  // Repository
  appInjection.registerFactory<KanaQuizRepository>(() => KanaQuizRepositoryImpl(
        hiraganaDataSource: appInjection(),
        katakanaDataSource: appInjection(),
      ));

  // Data Source
  appInjection
      .registerFactory<HiraganaDataSource>(() => HiraganaDataSourceImpl());
  appInjection
      .registerFactory<KatakanaDataSource>(() => KatakanaDataSourceImpl());
}
