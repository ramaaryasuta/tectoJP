import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get apiBaseUrl => dotenv.env['API_URL'] ?? 'API_URL';
}
