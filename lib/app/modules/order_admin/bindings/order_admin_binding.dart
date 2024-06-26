import 'package:get/get.dart';

import '../controllers/order_admin_controller.dart';

class OrderAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderAdminController>(
      () => OrderAdminController(),
    );
  }
}
