import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:travelyuk/app/modules/order_admin/controllers/order_admin_controller.dart';
import 'package:travelyuk/app/modules/order_detail_admin/services/order_detail_admin_service.dart';

class OrderDetailAdminController extends GetxController {
  Order order = Order();
  bool isLoading = false;
  final arguments = Get.arguments;
  OrderDetailAdminService service;
  OrderDetailAdminController(this.service);
  final orderC = Get.find<OrderAdminController>();

  @override
  void onInit() {
    super.onInit();
    order = arguments;
  }

  Future<void> changeIsPaid(String status) async {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await service.changeIsPaid(order.id ?? 0, status).then(
      (value) async {
        await getOrder();
      },
    ).catchError(
      (e) {
        EasyLoading.dismiss();
      },
    );
  }

  Future<void> getOrder() async {
    isLoading = true;
    update();
    await service.getOrder(order.id ?? 0).then(
      (value) {
        order = value;
        orderC.getOrdersByUser();
        EasyLoading.dismiss();
        isLoading = false;
        update();
      },
    ).catchError(
      (e) {
        isLoading = false;
        EasyLoading.dismiss();
        update();
      },
    );
  }
}
