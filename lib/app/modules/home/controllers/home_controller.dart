import 'package:get/get.dart';
import 'package:travelyuk/app/modules/dashboard/controllers/dashboard_controller.dart';

class HomeController extends GetxController {
  final dashboardC = Get.find<DashboardController>();

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

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
