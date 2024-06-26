import 'package:get/get.dart';

import '../controllers/bus_schedule_admin_controller.dart';

class BusScheduleAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusScheduleAdminController>(
      () => BusScheduleAdminController(),
    );
  }
}
