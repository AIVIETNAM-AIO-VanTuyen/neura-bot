import 'package:dio/dio.dart';
import '../http/dio_config.dart';

class AuthService {
  final Dio _dio = DioConfig.dio;

  Future<Response> login(String username, String password) async {
    final response = await _dio.post(
      '/accounts/login/',
      data: {'username': username, 'password': password},
    );
    return response;
  }
}
