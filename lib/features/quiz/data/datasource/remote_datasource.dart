import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_model.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuizModel>> getMainKana();
  Future<List<QuizModel>> getDakutenKana();
  Future<List<QuizModel>> getCombineKana();
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  Future<Map<String, dynamic>> _loadJson() async {
    String jsonString =
        await rootBundle.loadString('assets/quiz/hiragana_quiz.json');
    return json.decode(jsonString);
  }

  @override
  Future<List<QuizModel>> getMainKana() async {
    Map<String, dynamic> jsonData = await _loadJson();
    return (jsonData['main_hiragana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<QuizModel>> getDakutenKana() async {
    Map<String, dynamic> jsonData = await _loadJson();
    return (jsonData['dakuten_hiragana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<QuizModel>> getCombineKana() async {
    Map<String, dynamic> jsonData = await _loadJson();
    return (jsonData['combination_hiragana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }
}
