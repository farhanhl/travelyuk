import 'package:get/get.dart';

class HomeController extends GetxController {
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
