import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/modules/order_admin/services/orde_admin_service.dart';

class OrderAdminController extends GetxController {
  OrderAdminService service;
  OrderAdminController(this.service);
  GetOrders orders = GetOrders();
  final auth = Get.find<AuthController>();
  bool? isLoading;
  bool? isSuccess;

  Future<void> getOrdersByUser() async {
    isLoading = true;
    isSuccess = true;
    update();
    await service.getOrders().then(
      (value) {
        isSuccess = true;
        isLoading = false;
        orders = value;
        update();
      },
    ).catchError(
      (e) {
        isSuccess = false;
        isLoading = false;
        update();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    getOrdersByUser();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
