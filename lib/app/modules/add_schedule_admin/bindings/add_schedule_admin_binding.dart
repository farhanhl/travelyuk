import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/add_schedule_admin/controllers/add_schedule_admin_controller.dart';
import 'package:travelyuk/app/modules/add_schedule_admin/services/add_schedule_admin_service.dart';

class AddScheduleAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddScheduleAdminController>(
      () => AddScheduleAdminController(
        AddScheduleAdminService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
