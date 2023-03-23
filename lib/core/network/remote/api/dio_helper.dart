import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openai.com/v1/chat/',
        followRedirects: false,
        validateStatus: (status) => status! < 500,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer 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"
    };
    return await dio!.post(
      url,
      data: data,
    );
  }
}
