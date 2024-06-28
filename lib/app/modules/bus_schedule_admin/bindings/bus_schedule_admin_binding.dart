import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/bus_schedule_admin/services/bus_schedule_admin_service.dart';

import '../controllers/bus_schedule_admin_controller.dart';

class BusScheduleAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusScheduleAdminController>(
      () => BusScheduleAdminController(
        BusScheduleAdminService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
