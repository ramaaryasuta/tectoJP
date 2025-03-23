import 'package:dartz/dartz.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/repositories/kana_quiz_repository.dart';
import '../../presentation/cubit/quiz_cubit.dart';
import '../datasource/hiragana_datasource.dart';
import '../datasource/katakana_datasource.dart';

class KanaQuizRepositoryImpl extends KanaQuizRepository {
  final HiraganaDataSource hiraganaDataSource;
  final KatakanaDataSource katakanaDataSource;

  KanaQuizRepositoryImpl(
      {required this.hiraganaDataSource, required this.katakanaDataSource});

  @override
  Future<Either<ErrorState, List<Quiz>>> getMainKana(KanaType kanaType) async {
    try {
      if (kanaType == KanaType.hiragana) {
        List<Quiz> result = await hiraganaDataSource.getMainKana();
        return Right(result);
      } else {
        List<Quiz> result = await katakanaDataSource.getMainKana();
        return Right(result);
      }
    } catch (e) {
      return Left(ErrorState());
    }
  }

  @override
  Future<Either<ErrorState, List<Quiz>>> getDakutenKana(
      KanaType kanaType) async {
    try {
      if (kanaType == KanaType.hiragana) {
        List<Quiz> result = await hiraganaDataSource.getMainKana();
        return Right(result);
      } else {
        List<Quiz> result = await katakanaDataSource.getMainKana();
        return Right(result);
      }
    } catch (e) {
      return Left(ErrorState());
    }
  }

  @override
  Future<Either<ErrorState, List<Quiz>>> getCombineKana(
      KanaType kanaType) async {
    try {
      if (kanaType == KanaType.hiragana) {
        List<Quiz> result = await hiraganaDataSource.getCombineKana();
        return Right(result);
      } else {
        List<Quiz> result = await katakanaDataSource.getCombineKana();
        return Right(result);
      }
    } catch (e) {
      return Left(ErrorState());
    }
  }
}
