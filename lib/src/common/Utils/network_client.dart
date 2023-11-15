import 'package:dio/dio.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

class NetworkClient {
  NetworkClient({String baseUrl = Constants.baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));
  final Dio _dio;

  void setAuthToken(String authToken) {
    _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.post(path, data: data, queryParameters: queryParameters);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Add more methods for other HTTP methods as needed (e.g., PUT, DELETE, etc.)

  void _handleError(dynamic error) {
    // ... Error handling code from the previous example ...
  }

  // Constructor to create a new Dio client instance with a different base URL
  // staic DioClient newInstance({String baseUrl}) => DioClient(baseUrl: baseUrl);
}
