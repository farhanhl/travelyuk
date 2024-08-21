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
  int price = 0;
  int total = 0;
  int selectedPax = 0;
  bool isOneWay = false;
  List<int> selectedSeats = [];
  final arguments = Get.arguments;
  Schedules schedule = Schedules();
  OrderConfirmationService service;
  SubmitOrder submitOrder = SubmitOrder();
  OrderConfirmationController(this.service);
  OrdersController orderC = Get.find<OrdersController>();
  ScrollController seatController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController paxController = TextEditingController(text: "0");
  DashboardUserController dashboardC = Get.find<DashboardUserController>();

  @override
  void onInit() async {
    super.onInit();
    schedule = arguments;
    await freezeBookedSeat();
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
      schedule = arguments;
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
    if (isOneWay == true) {
      price = price * 2;
    } else {
      price = price ~/ 2;
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

  void updateSeatState(int index, bool newValue) {
    if (newValue == true) {
      selectedPax++;
    } else {
      selectedPax--;
    }
    switch (index) {
      case 0:
        schedule.seat?.seat1 = newValue;
        break;
      case 1:
        schedule.seat?.seat2 = newValue;
        break;
      case 2:
        schedule.seat?.seat3 = newValue;
        break;
      case 3:
        schedule.seat?.seat4 = newValue;
        break;
      case 4:
        schedule.seat?.seat5 = newValue;
        break;
      case 5:
        schedule.seat?.seat6 = newValue;
        break;
      case 6:
        schedule.seat?.seat7 = newValue;
        break;
      case 7:
        schedule.seat?.seat8 = newValue;
        break;
      case 8:
        schedule.seat?.seat9 = newValue;
        break;
      case 9:
        schedule.seat?.seat10 = newValue;
        break;
      case 10:
        schedule.seat?.seat11 = newValue;
        break;
      case 11:
        schedule.seat?.seat12 = newValue;
        break;
      case 12:
        schedule.seat?.seat13 = newValue;
        break;
      case 13:
        schedule.seat?.seat14 = newValue;
        break;
      case 14:
        schedule.seat?.seat15 = newValue;
        break;
      case 15:
        schedule.seat?.seat16 = newValue;
        break;
      case 16:
        schedule.seat?.seat17 = newValue;
        break;
      case 17:
        schedule.seat?.seat18 = newValue;
        break;
      case 18:
        schedule.seat?.seat19 = newValue;
        break;
      case 19:
        schedule.seat?.seat20 = newValue;
        break;
    }
    update();
  }

  Future<void> freezeBookedSeat() async {
    if (schedule.seat?.seat1 == true) selectedSeats.add(0);
    if (schedule.seat?.seat2 == true) selectedSeats.add(1);
    if (schedule.seat?.seat3 == true) selectedSeats.add(2);
    if (schedule.seat?.seat4 == true) selectedSeats.add(3);
    if (schedule.seat?.seat5 == true) selectedSeats.add(4);
    if (schedule.seat?.seat6 == true) selectedSeats.add(5);
    if (schedule.seat?.seat7 == true) selectedSeats.add(6);
    if (schedule.seat?.seat8 == true) selectedSeats.add(7);
    if (schedule.seat?.seat9 == true) selectedSeats.add(8);
    if (schedule.seat?.seat10 == true) selectedSeats.add(9);
    if (schedule.seat?.seat11 == true) selectedSeats.add(10);
    if (schedule.seat?.seat12 == true) selectedSeats.add(11);
    if (schedule.seat?.seat13 == true) selectedSeats.add(12);
    if (schedule.seat?.seat14 == true) selectedSeats.add(13);
    if (schedule.seat?.seat15 == true) selectedSeats.add(14);
    if (schedule.seat?.seat16 == true) selectedSeats.add(15);
    if (schedule.seat?.seat17 == true) selectedSeats.add(16);
    if (schedule.seat?.seat18 == true) selectedSeats.add(17);
    if (schedule.seat?.seat19 == true) selectedSeats.add(18);
    if (schedule.seat?.seat20 == true) selectedSeats.add(19);
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
