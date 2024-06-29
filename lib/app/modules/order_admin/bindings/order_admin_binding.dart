import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_admin/services/orde_admin_service.dart';

import '../controllers/order_admin_controller.dart';

class OrderAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderAdminController>(
      () => OrderAdminController(
        OrderAdminService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
