import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';
import 'package:travelyuk/app/models/submit_order_model.dart';
import 'package:travelyuk/app/modules/dashboard_user/controllers/dashboard_user_controller.dart';
import 'package:travelyuk/app/modules/order_confirmation/services/order_confirmation_service.dart';
import 'package:travelyuk/app/modules/orders/controllers/orders_controller.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/widgets/notification.dart';

class OrderConfirmationController extends GetxController {
  final arguments = Get.arguments;
  Schedules schedule = Schedules();
  OrderConfirmationService service;
  OrderConfirmationController(this.service);
  final dashboardC = Get.find<DashboardUserController>();
  final ScrollController seatController = ScrollController();
  final orderC = Get.find<OrdersController>();
  int price = 0;
  int total = 0;
  bool isOneWay = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController paxController = TextEditingController(text: "0");
  SubmitOrder submitOrder = SubmitOrder();

  @override
  void onInit() {
    super.onInit();
    schedule = arguments;
    nameController.text = dashboardC.userInformation.namaLengkap ?? "";
    price = int.parse(schedule.price ?? "0");
    total = price;
  }

  void setPax(bool isIncrease) {
    int currentValue = int.tryParse(paxController.text) ?? 0;
    if (isIncrease) {
      if (currentValue < 4) {
        currentValue++;
        paxController.text = currentValue.toString();
        total = price * currentValue;
      }
    } else {
      if (currentValue > 0) {
        currentValue--;
        paxController.text = currentValue.toString();
        total = price * currentValue;
      }
    }
    update();
  }

  void doSubmitOrder({required int pax, required String price}) async {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    FocusManager.instance.primaryFocus?.unfocus();
    submitOrder = SubmitOrder(
      userId: dashboardC.userInformation.id,
      scheduleId: schedule.id,
      pax: pax,
      price: price,
      isOneWay: isOneWay,
    );
    await service.addOrder(submitOrder).then(
      (value) {
        EasyLoading.dismiss();
        orderC.getOrdersByUser();
        CustomNotification.show(
          message:
              "Anda Berhasil Membuat Pesanan, Untuk Pembayaran Silahkan Ke Halaman Pesanan, Terima Kasih",
          isSuccess: true,
          backButton: () {
            Get.offNamedUntil(
              Routes.DASHBOARD,
              (route) => route.isFirst,
            );
          },
        );
      },
    ).catchError(
      (e) {
        EasyLoading.dismiss();
        CustomNotification.show(
          message: "$e",
          isSuccess: false,
          backButton: () => Get.back(),
        );
      },
    );
    update();
  }

  void changeIsOneWay(bool? inputedIsOneWay) {
    isOneWay = inputedIsOneWay ?? false;
    if (isOneWay) {
      price = price * 2;
    }
    update();
  }

  String countTotal() {
    int countedTotal = price * int.parse(paxController.text);
    if (isOneWay) {
      countedTotal * 2;
      return "$countedTotal";
    } else {
      return "$countedTotal";
    }
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
