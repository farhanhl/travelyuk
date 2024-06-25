import 'package:get/get.dart';

import '../controllers/login_admin_controller.dart';

class LoginAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginAdminController>(
      () => LoginAdminController(),
    );
  }
}
