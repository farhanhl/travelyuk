import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_const.dart';

class CustomWidget {
  static AppBar appBar({
    bool isLeading = false,
    bool isAdmin = false,
    VoidCallback? signOutFunction,
  }) {
    return AppBar(
      title: const Text(
        'Travel Yuk',
        style: TextStyle(
          color: lightColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: isLeading
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: lightColor,
                  size: 20,
                ),
                onPressed: () => Get.back(),
                tooltip: "Kembali",
              ),
            )
          : const SizedBox.shrink(),
      actions: [
        isAdmin
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: lightColor,
                    size: 20,
                  ),
                  onPressed: signOutFunction,
                  tooltip: "Keluar",
                ),
              )
            : const SizedBox.shrink()
      ],
      backgroundColor: primaryColor,
      toolbarHeight: 80,
      centerTitle: true,
    );
  }

  static Widget paymentInformation(int? total) {
    return SizedBox(
      height: 100.h,
      child: SizedBox(
        height: Get.height.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/bca.png"),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const Text("Nomor Rekening: $ACCOUNT_NUMBER"),
                const Text("Atas Nama: $ACCOUNT_HOLDER_NAME"),
                const Text("Bank: $BANK_NAME"),
                Text("Total: Rp.$total"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
