import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';

class ProfileController extends GetxController {
  final auth = Get.find<AuthController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    setProfileData();
  }

  void setProfileData() {
    nameController.text = auth.userInformation.namaLengkap ?? "";
    emailController.text = auth.userInformation.email ?? "";
    genderController.text = auth.userInformation.jenisKelamin ?? "";
    phoneNumberController.text = auth.userInformation.nomorTelfon ?? "";
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
