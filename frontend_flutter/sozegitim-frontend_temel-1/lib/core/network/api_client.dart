import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(
            // Kendi bilgisayarda test ediyorsan:
            // Android Emulator için: http://10.0.2.2:8000
            // iOS Simülatör veya Web için: http://127.0.0.1:8000
            baseUrl: 'http://127.0.0.1:8000/api/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );
}
