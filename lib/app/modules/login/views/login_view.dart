import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/login/services/login_service.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(
        LoginService(
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
                  SizedBox(
                    height: 10.h,
                  ),
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
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            fillColor: lightColor,
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: const Color(0xFFb2b7bf),
                              fontSize: 14.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.send,
                          obscureText: controller.isObsecure,
                          decoration: InputDecoration(
                            fillColor: lightColor,
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
                                color: shadowColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
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
                              child: GestureDetector(
                                onTap: () => controller.toggleRole(false),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.isAdmin
                                        ? shadowColor
                                        : userColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.r),
                                      bottomLeft: Radius.circular(18.r),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.user,
                                        color: lightColor,
                                        size: 16.sp,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "Pengguna",
                                        style: TextStyle(
                                          color: lightColor,
                                          fontSize: 13.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.toggleRole(true),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.isAdmin
                                        ? adminColor
                                        : shadowColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(18.r),
                                      bottomRight: Radius.circular(18.r),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.userTie,
                                        color: lightColor,
                                        size: 16.sp,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "Admin",
                                        style: TextStyle(
                                          color: lightColor,
                                          fontSize: 13.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                onPressed: () => controller.doLogin(
                                  inputedEmail: controller.emailController.text,
                                  inputedPassword:
                                      controller.passwordController.text,
                                ),
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    color: lightColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    "Belum punya akun?",
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
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        color: lightColor,
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
