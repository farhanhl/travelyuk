import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';
import 'package:travelyuk/app/modules/orders/services/orders_service.dart';
import 'package:travelyuk/app/modules/dashboard_user/controllers/dashboard_user_controller.dart';

class OrdersController extends GetxController {
  OrdersService service;
  OrdersController(this.service);
  GetOrders orders = GetOrders();
  final dashboardC = Get.find<DashboardUserController>();
  final auth = Get.find<AuthController>();
  bool? isLoading;
  bool? isSuccess;

  Future<void> getOrdersByUser() async {
    isLoading = true;
    isSuccess = true;
    update();
    await service.getOrdersByUser(auth.userInformation.id ?? 0).then(
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
