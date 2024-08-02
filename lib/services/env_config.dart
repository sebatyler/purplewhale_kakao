import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_config/flutter_config.dart';

class EnvConfig {
  static Future<void> init() async {
    if (kIsWeb) {
      await dotenv.load();
    } else {
      await FlutterConfig.loadEnvVariables();
    }
  }

  static String get(String key) {
    if (kIsWeb) {
      return dotenv.env[key]!;
    } else {
      return FlutterConfig.get(key);
    }
  }
}
