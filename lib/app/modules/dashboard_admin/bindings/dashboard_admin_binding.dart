import 'package:get/get.dart';

import '../controllers/dashboard_admin_controller.dart';

class DashboardAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardAdminController>(
      () => DashboardAdminController(),
    );
  }
}
