import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/bus_schedule_admin/controllers/bus_schedule_admin_controller.dart';
import 'package:travelyuk/app/modules/bus_schedule_admin/services/bus_schedule_admin_service.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/menu_models.dart';

class BusScheduleAdminView extends GetView<BusScheduleAdminController> {
  const BusScheduleAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusScheduleAdminController>(
      init: BusScheduleAdminController(
        BusScheduleAdminService(
          Get.find<Api>(),
        ),
      ),
      builder: (context) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jadwal",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 25.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(
                            primaryColor,
                          ),
                        ),
                        onPressed: () => Get.toNamed(Routes.ADD_SCHEDULE_ADMIN),
                        child: const Text(
                          "Buat Jadwal",
                          style: TextStyle(
                            color: lightColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  indent: 2,
                  color: darkColor,
                ),
                controller.isSuccess == false
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/error.png",
                              height: 150.h,
                              width: 150.w,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "Gagal memuat pesanan...",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color?>(
                                  primaryColor,
                                ),
                              ),
                              onPressed: () => controller.getSchedules(),
                              child: const Text(
                                "Muat Ulang",
                                style: TextStyle(
                                  color: lightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : controller.isLoading == true
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoadingAnimationWidget.newtonCradle(
                                  color: primaryColor,
                                  size: 200,
                                ),
                                const Text(
                                  "Memuat daftar pesanan...",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )
                        : (controller.schedule.schedules?.isEmpty ?? true)
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/empty.png",
                                      height: 150.h,
                                      width: 150.w,
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      "Tidak ada jadwal untuk saat ini..",
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color?>(
                                          primaryColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          controller.getSchedules(),
                                      child: const Text(
                                        "Muat Ulang",
                                        style: TextStyle(
                                          color: lightColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () => controller.getSchedules(),
                                  child: ListView.builder(
                                    itemCount:
                                        controller.schedule.schedules?.length ??
                                            0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Menu.scheduleHistory(
                                        controller.schedule.schedules?[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
              ],
            ),
          ),
        );
      },
    );
  }
}
