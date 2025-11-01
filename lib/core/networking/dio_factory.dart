import 'package:dio/dio.dart';
import 'package:movie_app_test/core/networking/api_consumer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory extends ApiConsumer {
  final Dio dio;

  DioFactory({required this.dio}) {
    final time = const Duration(seconds: 30);
    dio.options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      connectTimeout: time,
      receiveTimeout: time,
      //  headers: {'Content-Type': 'application/json'},
    );

    dio.interceptors.addAll([
      PrettyDioLogger(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
      // ApiInterceptorsWrapper(dio: dio),
    ]);
  }

  @override
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParametes,
  }) async {
    try {
      final result = await dio.get(endPoint, queryParameters: queryParametes);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
