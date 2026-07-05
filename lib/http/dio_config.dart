import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioConfig {
  static Dio getDio() {
    final dio = Dio();

    // Lấy BASE_URL từ .env
    final String? baseUrl = dotenv.env['BASE_URL'];

    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    } else {
      // Xử lý trường hợp BASE_URL không được định cấu hình
      // Có thể throw lỗi, log cảnh báo hoặc sử dụng một giá trị mặc định
      print('Warning: BASE_URL is not set in .env file.');
      // Ví dụ: dio.options.baseUrl = 'https://api.example.com';
    }

    // Thêm các interceptor khác nếu cần
    // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
