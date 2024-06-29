import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';

class ScheduleResultController extends GetxController {
  final arguments = Get.arguments;
  GetSchedules schedule = GetSchedules();

  @override
  void onInit() {
    super.onInit();
    schedule = arguments;
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
