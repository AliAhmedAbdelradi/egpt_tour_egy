import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio(BaseOptions(
      baseUrl: 'https://egypttourmate-001-site1.etempurl.com',
      receiveDataWhenStatusError: true,
      headers: {'Content-Type': 'application/json'}));

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    return dio.post(url, queryParameters: query, data: data);
  }
}
