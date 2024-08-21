import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:travelyuk/app/utils/app_func.dart';
import 'package:travelyuk/app/widgets/notification.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travelyuk/app/models/submit_register_model.dart';
import 'package:travelyuk/app/modules/register/services/register_service.dart';

class RegisterController extends GetxController {
  RegisterService service;
  RegisterController(this.service);
  String? gender;
  bool isObsecure = false;
  SubmitRegister submitRegister = SubmitRegister();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void toggle() {
    isObsecure = !isObsecure;
    update();
  }

  void changeGender(String selectedGender) {
    gender = selectedGender;
  }

  void doRegister({
    required String inputedEmail,
    required String inputedPassword,
    required String inputedGender,
    required String inputedName,
    required String inputedPhoneNumber,
  }) async {
    if (inputedEmail.isEmpty ||
        inputedPassword.isEmpty ||
        inputedGender.isEmpty ||
        inputedName.isEmpty ||
        inputedPhoneNumber.isEmpty) {
      CustomNotification.show(
        message: "Semua data harus diisi",
        isSuccess: false,
        backButton: () => Get.back(),
      );
    } else if (isValidEmail(inputedEmail) == false) {
      CustomNotification.show(
        message: "Harap masukkan email yang valid",
        isSuccess: false,
        backButton: () => Get.back(),
      );
    } else if (inputedPassword.length < 6) {
      CustomNotification.show(
        message: "Password tidak boleh kurang dari 6 karakter",
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
      submitRegister = SubmitRegister(
        email: inputedEmail,
        password: inputedPassword,
        jenisKelamin: inputedGender,
        namaLengkap: inputedName,
        nomorTelfon: inputedPhoneNumber,
        isAdmin: false,
      );
      await service.register(submitRegister).then(
        (value) {
          EasyLoading.dismiss();
          CustomNotification.show(
            message: "Akun anda berhasil didaftarkan",
            isSuccess: true,
            backButton: () => Get.back(),
          );
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
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
