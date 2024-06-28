import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/modules/auth/controller/auth_controller.dart';

class DashboardUserController extends GetxController {
  final auth = Get.find<AuthController>();
  UserGetLogin userInformation = UserGetLogin();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    userInformation = await auth.provideLoginInformation();
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
