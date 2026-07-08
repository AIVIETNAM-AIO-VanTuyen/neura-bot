import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configs/dio_configs.dart';
import 'dio_client.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

class DioConfig {
  static late final DioClient _dioClient;

  static DioClient get client => _dioClient;
  static Dio get dio => _dioClient.dio;

  static Future<void> init() async {
    final String baseUrl = dotenv.env['BASE_URL'] ?? 'https://api.example.com';

    final configs = DioConfigs(
      baseUrl: baseUrl,
      receiveTimeout: 10000,
      connectionTimeout: 10000,
    );

    _dioClient = DioClient(dioConfigs: configs);

    final authInterceptor = AuthInterceptor(
      accessToken: () async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.getString('auth_token');
      },
    );

    _dioClient.addInterceptors([
      authInterceptor,
      LoggingInterceptor(),
      RetryInterceptor(dio: _dioClient.dio),
    ]);
  }
}
