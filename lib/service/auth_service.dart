import 'package:dio/dio.dart';
import '../http/dio_config.dart';

class AuthService {
  final Dio _dio = DioConfig.getDio();

  Future<Response> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/accounts/login/',
        data: {
          'username': username,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      // Xử lý lỗi từ Dio, ví dụ: lỗi mạng, server trả về mã lỗi
      print('Dio error:');
      print('  Status code: ${e.response?.statusCode}');
      print('  Message: ${e.message}');
      // Bạn có thể throw lại lỗi hoặc trả về một đối tượng Response tùy chỉnh
      rethrow;
    } catch (e) {
      // Xử lý các lỗi khác
      print('An unexpected error occurred: $e');
      rethrow;
    }
  }
}
