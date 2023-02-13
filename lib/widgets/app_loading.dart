import 'package:flutter/material.dart';
import 'package:nearest/constant/app_size_utils.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return Container(
      // width: 100.w,
      // height: 100.h,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: SizedBox(
          height: 5.h,
          width: 5.h,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
