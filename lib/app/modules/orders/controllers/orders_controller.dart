import 'package:get/get.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/widgets/menu_models.dart';

class OrdersController extends GetxController {
  List<MenuModel>? orderHistory = [];

  @override
  void onInit() {
    super.onInit();
    orderHistory = [
      MenuModel(
        from: "Jakarta",
        to: "Semarang",
        price: "100.000",
        busName: "Sinar Jaya",
        date: DateTime.now().toString(),
        pax: "2",
        onTap: () => Get.toNamed(Routes.ORDER_DETAIL),
      ),
      MenuModel(
        from: "Surabaya",
        to: "Bandung",
        price: "150.000",
        busName: "Sinar Mas",
        date: DateTime.now().toString(),
        pax: "3",
        onTap: () => Get.toNamed(Routes.ORDER_DETAIL),
      ),
    ];
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
