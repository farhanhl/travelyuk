import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/theme/app_theme.dart';

class CustomNotification {
  static networkErrorHandle({required String message}) {
    return Get.rawSnackbar(
      messageText: Text(
        message,
        style: TextStyle(
          color: lightColor,
          fontSize: 14.sp,
        ),
      ),
      isDismissible: false,
      duration: const Duration(days: 1),
      backgroundColor: errorColor,
      icon: const Icon(
        Icons.wifi_off,
        color: lightColor,
        size: 35,
      ),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static show({
    required VoidCallback backButton,
    String backButtonText = "Kembali",
    String proceedButtonText = "Go",
    VoidCallback? proceedButton,
    String errorTitle = "Terjadi kesalahan",
    String successTitle = "Berhasil",
    String message = "Ada sesuatu yang",
    bool isHasTwoButton = false,
    required bool isSuccess,
  }) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "",
      content: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
            child: Container(
              color: darkColor.withOpacity(1),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: Column(
              children: [
                Image.asset(
                  isSuccess
                      ? "assets/images/success.png"
                      : "assets/images/error.png",
                  height: 150.h,
                  width: 150.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  isSuccess ? successTitle : errorTitle,
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: 12.sp),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(
                            primaryColor,
                          ),
                        ),
                        onPressed: backButton,
                        child: Text(
                          backButtonText,
                          style: const TextStyle(
                            color: lightColor,
                          ),
                        ),
                      ),
                    ),
                    isHasTwoButton
                        ? SizedBox(
                            width: 5.w,
                          )
                        : const SizedBox.shrink(),
                    isHasTwoButton
                        ? Expanded(
                            child: ElevatedButton(
                              onPressed: proceedButton!,
                              child: Text(
                                proceedButtonText,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static successHandle({
    required VoidCallback backButton,
    String title = "Success!",
    String message = "Successfully",
  }) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "",
      content: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(
          children: [
            Image.asset(
              "images/success.png",
              height: 150.h,
              width: 150.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              message,
              style: TextStyle(
                fontSize: 14.sp,
                color: shadowColor,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: backButton,
                    child: const Text("Close"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
