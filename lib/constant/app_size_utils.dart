import 'package:flutter/material.dart';

class AppSizeUtil {
  static late MediaQueryData _mediaQueryData ;
  static late double _textScaleFactor;

  static void init({required BuildContext context}) {
    _mediaQueryData = MediaQuery.of(context);
    _textScaleFactor = MediaQuery.textScaleFactorOf(context);
  }

  static double percentWidth(double num) {
    return num/100 * _mediaQueryData.size.width;
  }

  static double percentHeight(double num) {
    return num/100 * (_mediaQueryData.size.height - _mediaQueryData.padding.top);
  }

  static double statusBarHeight() {
    return _mediaQueryData.padding.top;
  }

  static double setSp(double num) {
    return num/_textScaleFactor;
  }
}

extension SizeExtension on num {
  double get w => AppSizeUtil.percentWidth(toDouble());
  double get h => AppSizeUtil.percentHeight(toDouble());
  double get sp => AppSizeUtil.setSp(toDouble());
}
