import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String title;
  final String romanji;

  const Quiz({required this.title, required this.romanji});

  @override
  List<Object?> get props => [title, romanji];
}
