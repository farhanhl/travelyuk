import 'package:get/get.dart';

import '../controllers/bus_schedule_user_controller.dart';

class BusScheduleUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusScheduleUserController>(
      () => BusScheduleUserController(),
    );
  }
}
