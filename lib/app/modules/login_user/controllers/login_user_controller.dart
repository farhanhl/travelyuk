import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginUserController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = false;

  void toggle() {
    isObsecure = !isObsecure;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
