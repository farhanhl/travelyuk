import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/register/services/register_service.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(
        RegisterService(
          Get.find<Api>(),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          APP_NAME,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: const Color(0xFFb2b7bf),
                              fontSize: 14.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          obscureText: controller.isObsecure,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: const Color(0xFFb2b7bf),
                              fontSize: 14.sp,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObsecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: primaryColor,
                              ),
                              onPressed: () {
                                controller.toggle();
                              },
                              splashRadius: 24.r,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: controller.nameController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: "Nama",
                            labelStyle: TextStyle(
                              color: const Color(0xFFb2b7bf),
                              fontSize: 14.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: shadowColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.r),
                            ),
                          ),
                          child: DropdownSearch<String>(
                            popupProps: const PopupProps.modalBottomSheet(
                              showSelectedItems: true,
                            ),
                            items: const [
                              "Laki-laki",
                              "Perempuan",
                            ],
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Jenis Kelamin",
                                labelStyle: TextStyle(color: shadowColor),
                              ),
                            ),
                            onChanged: (value) =>
                                controller.changeGender(value ?? ""),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: controller.phoneNumberController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: "Nomor Telfon",
                            labelStyle: TextStyle(
                              color: const Color(0xFFb2b7bf),
                              fontSize: 14.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color?>(
                                    primaryColor,
                                  ),
                                ),
                                onPressed: () => controller.doRegister(
                                  inputedEmail: controller.emailController.text,
                                  inputedPassword:
                                      controller.passwordController.text,
                                  inputedGender: controller.gender ?? "",
                                  inputedName: controller.nameController.text,
                                  inputedPhoneNumber:
                                      controller.phoneNumberController.text,
                                ),
                                child: const Text(
                                  "Daftar",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    "Sudah punya akun?",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color?>(
                        primaryColor,
                      ),
                    ),
                    onPressed: () => Get.toNamed(Routes.LOGIN_USER),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
