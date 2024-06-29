import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/modules/schedule_result/controllers/schedule_result_controller.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/menu_models.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleResultView extends GetView<ScheduleResultController> {
  const ScheduleResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleResultController>(
      init: ScheduleResultController(),
      builder: (context) {
        return Scaffold(
          appBar: CustomWidget.appBar(isLeading: true),
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Jadwal",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Divider(
                  indent: 2,
                  color: darkColor,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.schedule.schedules?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Menu.scheduleHistory(
                        controller.schedule.schedules?[index],
                        true,
                      );
                    },
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
