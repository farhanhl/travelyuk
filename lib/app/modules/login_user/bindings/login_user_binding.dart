import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/login_user/services/login_service.dart';

import '../controllers/login_user_controller.dart';

class LoginUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUserController>(
      () => LoginUserController(
        LoginService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
