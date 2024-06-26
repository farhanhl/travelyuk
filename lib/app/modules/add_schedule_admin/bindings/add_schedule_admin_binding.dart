import 'package:get/get.dart';

import '../controllers/add_schedule_admin_controller.dart';

class AddScheduleAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddScheduleAdminController>(
      () => AddScheduleAdminController(),
    );
  }
}
