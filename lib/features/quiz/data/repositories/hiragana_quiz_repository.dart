import 'package:dartz/dartz.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/repositories/kana_quiz_repository.dart';
import '../datasource/remote_datasource.dart';

class HiraganaQuizRepositoryImpl extends KanaQuizRepository {
  final QuizRemoteDataSource remoteDataSource;

  HiraganaQuizRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ErrorState, List<Quiz>>> getMainKana() async {
    try {
      List<Quiz> result = await remoteDataSource.getMainKana();
      return Right(result);
    } catch (e) {
      return Left(ErrorState());
    }
  }

  @override
  Future<Either<ErrorState, List<Quiz>>> getDakutenKana() async {
    try {
      List<Quiz> result = await remoteDataSource.getDakutenKana();
      return Right(result);
    } catch (e) {
      return Left(ErrorState());
    }
  }

  @override
  Future<Either<ErrorState, List<Quiz>>> getCombineKana() async {
    try {
      List<Quiz> result = await remoteDataSource.getCombineKana();
      return Right(result);
    } catch (e) {
      return Left(ErrorState());
    }
  }
}
