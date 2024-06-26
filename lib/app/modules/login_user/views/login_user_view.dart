import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/login_user/services/login_service.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import '../controllers/login_user_controller.dart';

class LoginUserView extends GetView<LoginUserController> {
  const LoginUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginUserController>(
      init: LoginUserController(
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
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintStyle: TextStyle(
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
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.send,
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
                        ToggleSwitch(
                          customWidths: [Get.width.w, Get.width.w],
                          cornerRadius: 20.0,
                          activeBgColors: const [
                            [Colors.cyan],
                            [Colors.redAccent]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['Pengguna', 'Admin'],
                          icons: const [
                            FontAwesomeIcons.user,
                            FontAwesomeIcons.userTie
                          ],
                          onToggle: (index) {
                            controller.toggleRole();
                          },
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
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text,
                                ),
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    color: Colors.white,
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
