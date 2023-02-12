import 'package:dio/dio.dart';
import 'package:nearest/services/network/interceptor.dart';

class AppDio {
  static String baseUrl = "https://maps.googleapis.com/maps/api/";
  // static String baseUrl = "https://www.google.com/maps/embed/v1/";

  // In this project we don't need header for the authentication token

  static Future<bool> executeApiWithTryCatch(Function function) async {
    try {
      await function();
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  static Dio dio() {
    BaseOptions options = BaseOptions(
      baseUrl: '$baseUrl/',
      contentType: 'application/json',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.json
    );


    Dio dio = Dio(options);
    dio.interceptors.add(AppInterceptor());
    return dio;
  }

}