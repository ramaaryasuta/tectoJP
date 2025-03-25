import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_model.dart';

abstract class HiraganaDataSource {
  Future<List<QuizModel>> getMainKana();
  Future<List<QuizModel>> getDakuonKana();
  Future<List<QuizModel>> getCombineKana();
}

class HiraganaDataSourceImpl implements HiraganaDataSource {
  // Load local hiragana json
  Future<Map<String, dynamic>> _loadHiraganaJson() async {
    String jsonString =
        await rootBundle.loadString('assets/quiz/hiragana_char.json');
    return json.decode(jsonString);
  }

  // return main hiragana only
  @override
  Future<List<QuizModel>> getMainKana() async {
    Map<String, dynamic> jsonData = await _loadHiraganaJson();
    return (jsonData['main_hiragana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }

  // return dakuten hiragana only
  @override
  Future<List<QuizModel>> getDakuonKana() async {
    Map<String, dynamic> jsonData = await _loadHiraganaJson();
    return (jsonData['dakuon_hiragana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }

  // return combination hiragana only
  @override
  Future<List<QuizModel>> getCombineKana() async {
    Map<String, dynamic> jsonData = await _loadHiraganaJson();
    return (jsonData['combination_hiragana'] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }
}
