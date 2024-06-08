import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'pallet.dart';

Widget toast(String message, {bool? success}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50.h),
        padding: EdgeInsets.all(12.0.h),
        decoration: BoxDecoration(
          color: !success! ? AppColor.red : AppColor.green,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                message,
                style: TextStyle(
                  color: !success ? AppColor.white : AppColor.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

showCustomToast(String message, {bool success = false, num? time}) {
  // dialogLocation(message: message, success: success, time: time);
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 3),
    onDismiss: () {},
  );
}
