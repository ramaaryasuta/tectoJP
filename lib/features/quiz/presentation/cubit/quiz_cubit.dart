import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tectojp/features/quiz/domain/usecase/get_dakuten_kana.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/usecase/get_combine_kana.dart';
import '../../domain/usecase/get_main_kana.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final GetMainKana getMainKanaUseCase;
  final GetDakutenKana getDakutenKanaUseCase;
  final GetCombineKana getCombineKanaUseCase;

  QuizCubit(this.getMainKanaUseCase, this.getDakutenKanaUseCase,
      this.getCombineKanaUseCase)
      : super(QuizInitial());

  Future<void> getMainKana() async {
    try {
      emit(QuizLoading());
      final result = await getMainKanaUseCase.execute();
      result.fold((l) => emit(QuizError(l)), (r) => emit(QuizLoaded(r)));
    } catch (e) {
      emit(QuizError(ErrorState()));
    }
  }

  Future<void> getDakutenKana() async {
    try {
      emit(QuizLoading());
      final result = await getDakutenKanaUseCase.execute();
      result.fold((l) => emit(QuizError(l)), (r) => emit(QuizLoaded(r)));
    } catch (e) {
      emit(QuizError(ErrorState()));
    }
  }

  Future<void> getCombineKana() async {
    try {
      emit(QuizLoading());
      final result = await getCombineKanaUseCase.execute();
      result.fold((l) => emit(QuizError(l)), (r) => emit(QuizLoaded(r)));
    } catch (e) {
      emit(QuizError(ErrorState()));
    }
  }
}
