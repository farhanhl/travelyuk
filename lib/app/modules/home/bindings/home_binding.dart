import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/home/services/home_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        HomeService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
