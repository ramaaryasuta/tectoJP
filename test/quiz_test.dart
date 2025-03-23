import 'package:flutter_test/flutter_test.dart';
import 'package:tectojp/features/quiz/data/datasource/remote_datasource.dart';
import 'package:tectojp/features/quiz/data/models/quiz_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late QuizRemoteDataSourceImpl dataSource;

  setUp(() {
    dataSource = QuizRemoteDataSourceImpl();
  });

  test('Should load and parse [main_hiragana] JSON correctly', () async {
    final result = await dataSource.getMainKana();

    expect(result, isA<List<QuizModel>>());
    expect(result.isNotEmpty, true);
  });

  test('Should load and parse [dakuten_hiragana] JSON correctly', () async {
    final result = await dataSource.getDakutenKana();
    expect(result.isNotEmpty, true);
  });

  test('Should load and parse [combination_hiragana] JSON correctly', () async {
    final result = await dataSource.getCombineKana();
    expect(result.isNotEmpty, true);
  });
}
