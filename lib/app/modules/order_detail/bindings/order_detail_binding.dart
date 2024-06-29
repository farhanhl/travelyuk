import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_detail/services/order_detail_service.dart';
import 'package:travelyuk/app/modules/order_detail/controllers/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailController>(
      () => OrderDetailController(
        OrderDetailService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
