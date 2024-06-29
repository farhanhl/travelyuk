import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_detail_admin/services/order_detail_admin_service.dart';

import '../controllers/order_detail_admin_controller.dart';

class OrderDetailAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailAdminController>(
      () => OrderDetailAdminController(
        OrderDetailAdminService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
