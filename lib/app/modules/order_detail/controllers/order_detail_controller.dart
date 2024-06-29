import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travelyuk/app/modules/orders/controllers/orders_controller.dart';
import 'package:travelyuk/app/modules/order_detail/services/order_detail_service.dart';

class OrderDetailController extends GetxController {
  bool isLoading = false;
  Order order = Order();
  OrderDetailService service;
  final arguments = Get.arguments;
  OrderDetailController(this.service);
  final orderC = Get.find<OrdersController>();

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

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
