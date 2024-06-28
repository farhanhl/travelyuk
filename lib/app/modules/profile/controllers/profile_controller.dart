import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final auth = Get.find<AuthController>();
  UserGetLogin userInformation = UserGetLogin();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    userInformation = await auth.provideLoginInformation();
    setProfileData();
  }

  void setProfileData() {
    nameController.text = userInformation.namaLengkap ?? "";
    emailController.text = userInformation.email ?? "";
    genderController.text = userInformation.jenisKelamin ?? "";
    phoneNumberController.text = userInformation.nomorTelfon ?? "";
    update();
  }

  void doLogOut() async {
    await auth.logout();
    Get.offAllNamed(Routes.LOGIN);
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
