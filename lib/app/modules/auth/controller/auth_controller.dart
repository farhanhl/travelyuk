import 'package:get/get.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/modules/auth/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthCacheService authCacheService = AuthCacheService();
  bool? isAuthenticated;
  bool? isUser;
  UserGetLogin userInformation = UserGetLogin();

  @override
  void onInit() async {
    super.onInit();
    await checkAuthentication();
  }

  Future<void> checkAuthentication() async {
    isAuthenticated = await authCacheService.readIsAuthenticated();
    if (isAuthenticated == true) {
      var tempUserData = authCacheService.readLoginInfo();
      userInformation = UserGetLogin.fromJson(tempUserData);
      isUser = userInformation.isUser;
    } else if (isAuthenticated == null) {
      authCacheService.saveIsAuthenticated(false);
      isAuthenticated = await authCacheService.readIsAuthenticated();
    }
  }

  Future<void> login(UserGetLogin? userData) async {
    await authCacheService.saveIsAuthenticated(true);
    await authCacheService.saveLogininfo(userData);
    var tempUserData = authCacheService.readLoginInfo();
    userInformation = UserGetLogin.fromJson(tempUserData);
    isAuthenticated = await authCacheService.readIsAuthenticated();
  }

  Future<UserGetLogin> provideLoginInformation() async {
    var tempUserData = authCacheService.readLoginInfo();
    return userInformation = UserGetLogin.fromJson(tempUserData);
  }

  Future<void> logout() async {
    await authCacheService.saveIsAuthenticated(false);
    await authCacheService.removeLoginInfo();
  }
}
