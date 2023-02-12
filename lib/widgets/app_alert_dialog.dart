import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:nearest/constant/app_size_utils.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onOk;

  CustomAlertDialog({
    required this.title,
    required this.message,
    required this.onOk,
  });

  @override
  Widget build(BuildContext context) {

    AppSizeUtil.init(context: context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(30.h),
            child: Icon(
              Icons.delete_forever,
              size: 100.h,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 25.w),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
                    elevation: 20.h,
                  ),
                  onPressed: () => Get.back(),
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(width: 50.w),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
                    elevation: 20.h,
                  ),
                  onPressed: () async => await onOk(),
                  child: Text(
                    "DELETE",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(width: 25.w),
            ],
          ),
        ],
      ),
    );
  }
}
