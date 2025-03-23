import '../../domain/entities/quiz.dart';

class QuizModel extends Quiz {
  const QuizModel({required super.title, required super.romanji}) : super();

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(title: json['kana'], romanji: json['romaji']);
  }

  Map<String, dynamic> toJson() => {'kana': title, 'romaji': romanji};
}
