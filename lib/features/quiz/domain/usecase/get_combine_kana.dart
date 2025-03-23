import 'package:dartz/dartz.dart';

import '../../../../core/utils/error.dart';
import '../../presentation/cubit/quiz_cubit.dart';
import '../entities/quiz.dart';
import '../repositories/kana_quiz_repository.dart';

class GetCombineKana {
  final KanaQuizRepository kanaQuizRepository;

  const GetCombineKana(this.kanaQuizRepository);

  Future<Either<ErrorState, List<Quiz>>> execute(KanaType kanaType) async {
    return await kanaQuizRepository.getCombineKana(kanaType);
  }
}
