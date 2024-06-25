import 'package:get/get.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final auth = Get.find<AuthController>();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      if (auth.isAuthenticated == true) {
        Get.offNamed(Routes.DASHBOARD);
      } else {
        Get.offNamed(Routes.LOGIN_USER);
      }
    });
  }

  // bool isAuthenticated() {
  //   var loginInformation = "Asd";
  //   return true;
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
