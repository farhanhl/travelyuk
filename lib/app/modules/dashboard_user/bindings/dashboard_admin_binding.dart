import 'package:get/get.dart';
import 'package:travelyuk/app/modules/dashboard_user/controllers/dashboard_user_controller.dart';

class DashboardUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardUserController>(
      () => DashboardUserController(),
    );
  }
}
