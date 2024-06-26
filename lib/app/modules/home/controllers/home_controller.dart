import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:travelyuk/app/modules/home/services/home_service.dart';
import 'package:travelyuk/app/widgets/notification.dart';

class HomeController extends GetxController {
  final dashboardC = Get.find<DashboardController>();
  HomeService service;
  HomeController(this.service);
  String? originCity;
  String? destinationCity;
  DateTime? date;

  Future<List<String>> getEmployee() async {
    return ["-"];
    // if (allModelemployee.isEmpty) {
    //   try {
    //     SoeDetail internalValue = await service.getEmployee();
    //     SoeDetail externalValue = await service.getExternalEmployee();
    //     allModelemployee.addAll(internalValue.body!.data!);
    //     allModelemployee.addAll(externalValue.body!.data!);
    //     return allModelemployee;
    //   } catch (e) {
    //     return allModelemployee;
    //   }
    // } else {
    //   return allModelemployee;
    // }
  }

  @override
  void onInit() {
    super.onInit();
  }

  bool isAllFilled() {
    if ((originCity?.isNotEmpty ?? false) ||
        (destinationCity?.isNotEmpty ?? false) ||
        date != null) {
      return true;
    } else {
      return false;
    }
  }

  void doSearchBus() async {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    // await service.doSearchBus(submitLogin).then(
    //   (value) {
    //     EasyLoading.dismiss();
    //   },
    // ).catchError(
    //   (e) {
    //     EasyLoading.dismiss();
    //     CustomNotification.errorHandle(
    //       message: "$e",
    //       backButton: () => Get.back(),
    //     );
    //   },
    // );
    update();
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
