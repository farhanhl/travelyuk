import 'package:get/get.dart';
import 'package:travelyuk/app/modules/schedule_result/controllers/schedule_result_controller.dart';

class ScheduleResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleResultController>(
      () => ScheduleResultController(),
    );
  }
}
