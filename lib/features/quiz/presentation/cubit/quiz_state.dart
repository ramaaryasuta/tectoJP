part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Quiz> quizes;
  const QuizLoaded(this.quizes);
}

class QuizError extends QuizState {
  final ErrorState errorState;
  const QuizError(this.errorState);
}
