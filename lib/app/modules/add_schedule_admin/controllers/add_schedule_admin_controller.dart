import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/models/submit_schedule_model.dart';
import 'package:travelyuk/app/modules/add_schedule_admin/services/add_schedule_admin_service.dart';
import 'package:travelyuk/app/modules/bus_schedule_admin/controllers/bus_schedule_admin_controller.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:travelyuk/app/widgets/notification.dart';

class AddScheduleAdminController extends GetxController {
  List<Cities> cities = [];
  String? originCity;
  String? destinationCity;
  String? date;
  int? originCityId;
  int? destinationCityId;
  AddScheduleAdminService service;
  AddScheduleAdminController(this.service);
  SubmitSchedule submitSchedule = SubmitSchedule();
  final scheduleAdmin = Get.find<BusScheduleAdminController>();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController busNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Time time = Time(hour: 00, minute: 00, second: 00);

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

  void changeTime(TimeOfDay time) {
    String formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    departureTimeController.text = formattedTime;
    update();
  }

  bool isAllFilled() {
    if (originCityId == null ||
        destinationCityId == null ||
        (date?.isEmpty ?? false) ||
        departureTimeController.text.isEmpty ||
        busNameController.text.isEmpty ||
        priceController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void addSchedule({
    required int inputedOriginCityId,
    required int inputedDestinationCityId,
    required String inputedDate,
    required String inputedDepartureTime,
    required String inputedBusName,
    required double inputedPrice,
  }) async {
    if (inputedOriginCityId == inputedDestinationCityId) {
      CustomNotification.show(
        message: "Kota yang dituju harus berbeda dengan kota awal",
        isSuccess: false,
        backButton: () => Get.back(),
      );
    } else {
      EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      FocusManager.instance.primaryFocus?.unfocus();
      submitSchedule = SubmitSchedule(
        originCityId: inputedOriginCityId,
        destinationCityId: inputedDestinationCityId,
        date: inputedDate,
        departureTime: inputedDepartureTime,
        busName: inputedBusName,
        price: inputedPrice,
      );
      await service.addSchedule(submitSchedule).then(
        (value) {
          EasyLoading.dismiss();
          CustomNotification.show(
            message: "Berhasil menambah jadwal",
            isSuccess: true,
            backButton: () {
              scheduleAdmin.getSchedules();
              Get.offNamedUntil(
                Routes.DASHBOARD_ADMIN,
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
