import 'package:dartz/dartz.dart';

import '../../../../core/utils/error.dart';
import '../../presentation/cubit/quiz_cubit.dart';
import '../entities/quiz.dart';

abstract class KanaQuizRepository {
  Future<Either<ErrorState, List<Quiz>>> getMainKana(KanaType kanaType);
  Future<Either<ErrorState, List<Quiz>>> getDakutenKana(KanaType kanaType);
  Future<Either<ErrorState, List<Quiz>>> getCombineKana(KanaType kanaType);
}
