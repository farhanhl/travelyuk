import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final auth = Get.find<AuthController>();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 1), () {
      log(jsonEncode(auth.userInformation));
      if (auth.isAuthenticated == true) {
        if (auth.isAdmin == false) {
          Get.offNamed(Routes.DASHBOARD);
        } else if (auth.isAdmin == true) {
          Get.offNamed(Routes.DASHBOARD_ADMIN);
        } else {
          Get.offNamed(Routes.LOGIN);
        }
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
