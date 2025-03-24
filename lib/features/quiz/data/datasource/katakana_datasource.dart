import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_model.dart';

abstract class KatakanaDataSource {
  Future<List<QuizModel>> getMainKana();
  Future<List<QuizModel>> getDakutenKana();
  Future<List<QuizModel>> getCombineKana();
}

class KatakanaDataSourceImpl implements KatakanaDataSource {
  // load katakana json
  Future<Map<String, dynamic>> _loadKatakanaJson() async {
    String jsonString =
        await rootBundle.loadString('assets/quiz/katakana_quiz.json');
    return json.decode(jsonString);
  }

  // return list main katakana
  @override
  Future<List<QuizModel>> getMainKana() async {
    Map<String, dynamic> jsonData = await _loadKatakanaJson();
    return (jsonData['main_katakana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }

  // return list dakuten katakana
  @override
  Future<List<QuizModel>> getDakutenKana() async {
    Map<String, dynamic> jsonData = await _loadKatakanaJson();
    return (jsonData['dakuten_katakana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }

  // return list combine katakana
  @override
  Future<List<QuizModel>> getCombineKana() async {
    Map<String, dynamic> jsonData = await _loadKatakanaJson();
    return (jsonData['combination_katakana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }
}
