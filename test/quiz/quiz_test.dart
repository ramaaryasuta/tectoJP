import 'package:flutter_test/flutter_test.dart';
import 'package:tectojp/features/quiz/data/datasource/hiragana_datasource.dart';
import 'package:tectojp/features/quiz/data/datasource/katakana_datasource.dart';
import 'package:tectojp/features/quiz/data/models/quiz_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late HiraganaDataSource hiraganaDataSource;
  late KatakanaDataSource katakanaDataSource;

  setUp(() {
    hiraganaDataSource = HiraganaDataSourceImpl();
    katakanaDataSource = KatakanaDataSourceImpl();
  });

  group('Hiragana Quiz Test', () {
    // Testing for Hiragana json
    test('Should load and parse [main_hiragana] JSON correctly', () async {
      final result = await hiraganaDataSource.getMainKana();

      expect(result, isA<List<QuizModel>>());
      expect(result.isNotEmpty, true);
    });

    test('Should load and parse [dakuten_hiragana] JSON correctly', () async {
      final result = await hiraganaDataSource.getDakutenKana();
      expect(result.isNotEmpty, true);
    });

    test('Should load and parse [combination_hiragana] JSON correctly',
        () async {
      final result = await hiraganaDataSource.getCombineKana();
      expect(result.isNotEmpty, true);
    });
  });

  group('Katakana Quiz Test', () {
    // Testing for Katakana json
    test('Should load and parse [main_katakana] JSON correctly', () async {
      final result = await katakanaDataSource.getMainKana();

      expect(result, isA<List<QuizModel>>());
      expect(result.isNotEmpty, true);
    });

    test('Should load and parse [dakuten_katakana] JSON correctly', () async {
      final result = await katakanaDataSource.getDakutenKana();
      expect(result.isNotEmpty, true);
    });

    test('Should load and parse [combination_katakana] JSON correctly',
        () async {
      final result = await katakanaDataSource.getCombineKana();
      expect(result.isNotEmpty, true);
    });
  });
}
