import 'package:get/get.dart';
import 'package:travelyuk/app/modules/auth/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthCacheService _authCacheService = AuthCacheService();
  bool? isLogedIn;

  @override
  void onInit() {
    super.onInit();
    checkAuthentication();
  }

  void checkAuthentication() async {
    var userInformation = _authCacheService.readLoginInfo();
    if (userInformation == null) {
      isLogedIn = false;
    } else {
      isLogedIn = true;
    }
  }
}
