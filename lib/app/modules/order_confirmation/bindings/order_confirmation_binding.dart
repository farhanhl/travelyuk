import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_confirmation/services/order_confirmation_service.dart';
import '../controllers/order_confirmation_controller.dart';

class OrderConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderConfirmationController>(
      () => OrderConfirmationController(
        OrderConfirmationService(
          Get.find<Api>(),
        ),
      ),
    );
  }
}
