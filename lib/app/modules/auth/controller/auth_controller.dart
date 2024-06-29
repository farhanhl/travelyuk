import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/modules/auth/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthCacheService authCacheService = AuthCacheService();
  bool? isAuthenticated;
  bool? isAdmin;
  UserGetLogin userInformation = UserGetLogin();
  final box = GetStorage();

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
      authCacheService.saveIsAdmin(userInformation.isAdmin);
      isAdmin = authCacheService.readIsAdmin();
    } else if (isAuthenticated == null) {
      authCacheService.saveIsAuthenticated(false);
      isAuthenticated = await authCacheService.readIsAuthenticated();
    }
  }

  Future<void> login(UserGetLogin userData) async {
    await authCacheService.saveIsAuthenticated(true);
    await authCacheService.saveLogininfo(userData);
    await authCacheService.saveIsAdmin(userData.isAdmin);
    var tempUserData = authCacheService.readLoginInfo();
    userInformation = UserGetLogin.fromJson(tempUserData);
    isAdmin = authCacheService.readIsAdmin();
  }

  Future<UserGetLogin> provideLoginInformation() async {
    var tempUserData = authCacheService.readLoginInfo();
    userInformation = UserGetLogin.fromJson(tempUserData);
    return userInformation;
  }

  Future<void> logout() async {
    await authCacheService.removeIsAuthenticated();
    await authCacheService.removeLoginInfo();
    await authCacheService.removeIsAdmin();
    checkAuthentication();
  }
}
