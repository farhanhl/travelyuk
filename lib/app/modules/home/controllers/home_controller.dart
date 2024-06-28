import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travelyuk/app/models/submit_search_schedule_model.dart';
import 'package:travelyuk/app/modules/home/services/home_service.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/widgets/notification.dart';

class HomeController extends GetxController {
  List<Cities> cities = [];
  HomeService service;
  HomeController(this.service);
  String? originCity;
  String? destinationCity;
  String? date;
  int? originCityId;
  int? destinationCityId;
  SubmitSearchSchedule submitSearchSchedule = SubmitSearchSchedule();

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

  void changeCity({
    required bool isOrigin,
    required String cityName,
    required int cityId,
  }) {
    if (isOrigin == true) {
      originCity = cityName;
      originCityId = cityId;
    } else {
      destinationCity = cityName;
      destinationCityId = cityId;
    }
    update();
  }

  void changeDate(DateTime? dateTime) {
    date = DateFormat('yyyy-MM-dd').format(dateTime!);
    update();
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

  void doSearchBus({
    required int inputedOriginCityId,
    required int inputedDestinationCityId,
    required String inputedDate,
  }) async {
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    submitSearchSchedule = SubmitSearchSchedule(
      originCityId: inputedOriginCityId,
      destinationCityId: inputedOriginCityId,
      date: inputedDate,
    );
    await service.searchSchedule(submitSearchSchedule).then(
      (value) {
        EasyLoading.dismiss();
        // Get.toNamed(Routes.Sche);
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

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
