import 'package:dartz/dartz.dart';

import '../../../../core/utils/error.dart';
import '../../presentation/cubit/quiz_cubit.dart';
import '../entities/quiz.dart';
import '../repositories/kana_quiz_repository.dart';

class GetDakutenKana {
  final KanaQuizRepository kanaQuizRepository;

  const GetDakutenKana(this.kanaQuizRepository);

  Future<Either<ErrorState, List<Quiz>>> execute(KanaType kanaType) async {
    return await kanaQuizRepository.getDakutenKana(kanaType);
  }
}
