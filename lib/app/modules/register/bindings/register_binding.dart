import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/register/controllers/register_controller.dart';
import 'package:travelyuk/app/modules/register/services/register_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        RegisterService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
