import 'package:dartz/dartz.dart';

import '../../../../core/utils/error.dart';
import '../entities/quiz.dart';

abstract class KanaQuizRepository {
  Future<Either<ErrorState, List<Quiz>>> getMainKana();
  Future<Either<ErrorState, List<Quiz>>> getDakutenKana();
  Future<Either<ErrorState, List<Quiz>>> getCombineKana();
}
