import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:travelyuk/app/modules/home/services/home_service.dart';
import 'package:travelyuk/app/widgets/notification.dart';

class HomeController extends GetxController {
  List<Cities> cities = [];
  final dashboardC = Get.find<DashboardController>();
  HomeService service;
  HomeController(this.service);
  String? originCity;
  String? destinationCity;
  DateTime? date;

  @override
  void onInit() async {
    super.onInit();
    await getCities();
  }

  Future<List<Cities>> getCities() async {
    if (cities.isEmpty) {
      try {
        GetCities value = await service.getCities();
        cities.addAll(value.cities ?? []);
        return cities;
      } catch (e) {
        return cities;
      }
    } else {
      return cities;
    }
  }

  void changeCity({required bool isOrigin, required String city}) {
    if (isOrigin == true) {
      originCity = city;
    } else {
      destinationCity = city;
    }
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
