import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:nearest/constant/app_size_utils.dart';
import 'package:nearest/constant/app_text_style.dart';
import 'package:nearest/services/network/app_dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Request Url : ${AppDio.baseUrl}${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("Response Code : ${response.statusCode}");
    debugPrint("Response Data : ${response.data}");

    if (response.statusCode == 200) {
      if (response.data['status'] == "REQUEST_DENIED") {
        // message = "${err.response?.data['error_message']}";
        Get.snackbar("Request Denied", "${response.data['error_message']}",
            backgroundColor: Colors.amber,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 2.w),
            borderRadius: 5.sp,
            onTap: (snack) => Get.back(),
            mainButton: TextButton(onPressed: () => Get.back(), child: Text('OK', style: AppTextStyle.buttonText)));
      }
    }

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
            message = "";
            break;
        }
        break;
      default:
        message = "Unknown Error";
        break;
    }

    debugPrint("ErrorMessage : $message");

    Get.snackbar("Error Message", "message",
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 2.w),
        borderRadius: 5.sp,
        onTap: (snack) => Get.back(),
        mainButton: TextButton(onPressed: () => Get.back(), child: Text('OK', style: AppTextStyle.buttonText)));

    // AppSnackBar.show(status: SnackBarStatus.error, title: "Message Error", message: message,withButton: false);

    super.onError(err, handler);
  }
}
