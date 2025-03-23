import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/usecase/get_combine_kana.dart';
import '../../domain/usecase/get_dakuten_kana.dart';
import '../../domain/usecase/get_main_kana.dart';

part 'quiz_state.dart';

enum KanaType { hiragana, katakana }

enum QuizType { main, dakuten, combine, all }

class QuizCubit extends Cubit<QuizState> {
  final GetMainKana getMainKanaUseCase;
  final GetDakutenKana getDakutenKanaUseCase;
  final GetCombineKana getCombineKanaUseCase;

  QuizCubit(
    this.getMainKanaUseCase,
    this.getDakutenKanaUseCase,
    this.getCombineKanaUseCase,
  ) : super(QuizInitial());

  List<Quiz> quizActive = [];

  Future<void> kanaShuffleRandomQuiz({
    required QuizType quizType,
    required KanaType kanaType,
  }) async {
    try {
      emit(QuizLoading());

      List<Quiz> quizzes = [];

      // Fungsi bantu untuk mengambil data quiz
      Future<void> fetchQuizData(
          Future<Either<ErrorState, List<Quiz>>> Function() useCase) async {
        final result = await useCase();
        result.fold(
          (l) => log('Error fetching quiz data: $l'),
          (r) => quizzes.addAll(r),
        );
      }

      // Tentukan kuis berdasarkan tipe
      switch (quizType) {
        case QuizType.main:
          await fetchQuizData(() => getMainKanaUseCase.execute(kanaType));
          break;
        case QuizType.dakuten:
          await fetchQuizData(() => getDakutenKanaUseCase.execute(kanaType));
          break;
        case QuizType.combine:
          await fetchQuizData(() => getCombineKanaUseCase.execute(kanaType));
          break;
        case QuizType.all:
          await Future.wait([
            fetchQuizData(() => getMainKanaUseCase.execute(kanaType)),
            fetchQuizData(() => getDakutenKanaUseCase.execute(kanaType)),
            fetchQuizData(() => getCombineKanaUseCase.execute(kanaType)),
          ]);
          break;
      }

      if (quizzes.isEmpty) {
        emit(QuizError(ErrorState()));
        return;
      }

      quizActive = List.from(quizzes)..shuffle();
      quizActive = quizActive.take(quizType == QuizType.all ? 60 : 40).toList();

      emit(QuizLoaded(quizActive));
    } catch (e, stackTrace) {
      log('Error while shuffleRandomQuiz: $e', stackTrace: stackTrace);
      emit(QuizError(ErrorState()));
    }
  }
}
