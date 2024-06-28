import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';
import 'package:travelyuk/app/modules/bus_schedule_admin/services/bus_schedule_admin_service.dart';

class BusScheduleAdminController extends GetxController {
  BusScheduleAdminService service;
  BusScheduleAdminController(this.service);
  GetSchedules schedule = GetSchedules();
  bool? isLoading;
  bool? isSuccess;

  @override
  void onInit() async {
    super.onInit();
    await getSchedules();
  }

  Future<void> getSchedules() async {
    isLoading = true;
    isSuccess = true;
    update();
    await service.getSchedules().then(
      (value) {
        isSuccess = true;
        isLoading = false;
        schedule = value;
        update();
      },
    ).catchError(
      (e) {
        isSuccess = false;
        isLoading = false;
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
