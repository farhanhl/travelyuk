import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  enabled: false,
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
                  enabled: false,
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
                  enabled: false,
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
                  enabled: false,
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
                          backgroundColor: WidgetStateProperty.all<Color?>(
                            const Color(0xFF006298),
                          ),
                        ),
                        onPressed: () => null,
                        child: const Text(
                          "Keluar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
