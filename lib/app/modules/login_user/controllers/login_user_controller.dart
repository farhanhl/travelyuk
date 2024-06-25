import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/models/submit_login_model.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/modules/login_user/services/login_service.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/widgets/notification.dart';

class LoginUserController extends GetxController {
  LoginService service;
  LoginUserController(this.service);
  TextEditingController emailController = TextEditingController(
    text: "farhanhl@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "password",
  );
  final auth = Get.find<AuthController>();
  SubmitLogin submitLogin = SubmitLogin();
  bool isObsecure = true;

  void toggle() {
    isObsecure = !isObsecure;
    update();
  }

  void doLogin({
    String? email,
    String? password,
  }) async {
    if (email!.isEmpty || password!.isEmpty) {
      CustomNotification.errorHandle(
        message: "Email atau Password Belum Diisi",
        backButton: () => Get.back(),
      );
    } else {
      EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      submitLogin.email = email;
      submitLogin.password = password;
      await service.login(submitLogin).then(
        (value) {
          auth.login(value.user);
          EasyLoading.dismiss();
          Get.offNamed(Routes.DASHBOARD);
        },
      ).catchError(
        (e) {
          EasyLoading.dismiss();
          CustomNotification.errorHandle(
            message: "$e",
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
