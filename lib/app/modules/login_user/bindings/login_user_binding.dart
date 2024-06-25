import 'package:get/get.dart';

import '../controllers/login_user_controller.dart';

class LoginUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUserController>(
      () => LoginUserController(),
    );
  }
}
