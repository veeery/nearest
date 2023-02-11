import 'package:flutter/material.dart';
import 'package:nearest/constant/app_size_utils.dart';

class AppButton extends StatelessWidget {

  double? width;
  double? height;
  String title;
  Color? color;
  Function() onTap;

  AppButton({
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.color
});

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return Material(
      color: color ?? Colors.grey[400],
      borderRadius: BorderRadius.circular(5.sp),
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(5.sp),
        onTap: onTap,
        child: Container(
          width: width ?? 20.w,
          height: height ?? 5.h,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.transparent, borderRadius: BorderRadius.circular(5.sp)),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
