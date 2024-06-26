import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/utils/app_func.dart';
import 'package:travelyuk/app/widgets/notification.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travelyuk/app/models/submit_login_model.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/modules/login/services/login_service.dart';

class LoginController extends GetxController {
  LoginService service;
  LoginController(this.service);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = Get.find<AuthController>();
  SubmitLogin submitLogin = SubmitLogin();
  bool isObsecure = true;
  bool isAdmin = false;

  void toggle() {
    isObsecure = !isObsecure;
    update();
  }

  void toggleRole(bool isAdmin) {
    this.isAdmin = isAdmin;
    update();
  }

  void doLogin({
    String? inputedEmail,
    String? inputedPassword,
  }) async {
    if (inputedEmail!.isEmpty || inputedPassword!.isEmpty) {
      CustomNotification.show(
        message: "Email atau Password Belum Diisi",
        isSuccess: false,
        backButton: () => Get.back(),
      );
    } else if (isValidEmail(inputedEmail) == false) {
      CustomNotification.show(
        message: "Harap masukkan email yang valid",
        isSuccess: false,
        backButton: () => Get.back(),
      );
    } else {
      EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      FocusManager.instance.primaryFocus?.unfocus();
      submitLogin = SubmitLogin(
        email: inputedEmail,
        password: inputedPassword,
        isAdmin: isAdmin,
      );
      await service.login(submitLogin).then(
        (value) {
          auth.login(value.user!);
          EasyLoading.dismiss();
          if (value.user!.isAdmin == true) {
            Get.offAllNamed(Routes.DASHBOARD_ADMIN);
          } else {
            Get.offNamed(Routes.DASHBOARD);
          }
        },
      ).catchError(
        (e) {
          EasyLoading.dismiss();
          CustomNotification.show(
            message: "$e",
            isSuccess: false,
            backButton: () => Get.back(),
          );
        },
      );
      update();
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
