import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nearest/services/network/app_dio.dart';
class AppInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Request Url : ${AppDio.baseUrl}${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // debugPrint("Response Data : ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String message = "";

    switch (err.type) {
      case DioErrorType.connectTimeout:
        message = "Connection Time Out";
        break;
      case DioErrorType.receiveTimeout:
        message = "Received Time Out";
        break;
      case DioErrorType.sendTimeout:
        message = "Send Time Out";
        break;
      case DioErrorType.other:
        message = "Internet Problems";
        break;
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 401:
            message = "Unauthorized";
            break;
          case 404:
            message = "Not Found";
            break;
          case 500:
            message = "Internal Server Error";
            break;
          default:
          // Get MessageError From back-end
            message = err.response!.data['message'];
            break;
        }
        break;
      default:
        message = "Unknown Error";
        break;
    }

    debugPrint("ErrorMessage : $message");

    // AppSnackBar.show(status: SnackBarStatus.error, title: "Message Error", message: message,withButton: false);

    super.onError(err, handler);
  }

}