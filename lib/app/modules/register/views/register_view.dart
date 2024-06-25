import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:travelyuk/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Daftar di ",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Travel Yuk",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF006298),
                          ),
                        ),
                      ],
                    ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
                              hintStyle: TextStyle(
                                color: const Color(0xFFb2b7bf),
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
                              hintStyle: TextStyle(
                                color: const Color(0xFFb2b7bf),
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Nama",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: controller.nameController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
                              hintStyle: TextStyle(
                                color: const Color(0xFFb2b7bf),
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Jenis Kelamin",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: controller.genderController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
                              hintStyle: TextStyle(
                                color: const Color(0xFFb2b7bf),
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Nomor Telfon",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: controller.phoneNumberController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
                              hintStyle: TextStyle(
                                color: const Color(0xFFb2b7bf),
                                fontSize: 18.sp,
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
                                      const Color(0xFF006298),
                                    ),
                                  ),
                                  onPressed: () => null,
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
                          const Color(0xFF006298),
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
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      "Masuk sebagai admin?",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color?>(
                          const Color(0xFF006298),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.LOGIN_ADMIN),
                      child: const Text(
                        "Masuk sebagai Admin",
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
        });
  }
}
