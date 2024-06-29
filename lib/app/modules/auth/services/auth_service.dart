import 'package:get_storage/get_storage.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/utils/app_const.dart';

class AuthCacheService {
  final box = GetStorage();

  // Data User
  Future<void> saveLogininfo(UserGetLogin? userData) async {
    await box.remove(LOGIN_INFORMATION);
    await box.write(LOGIN_INFORMATION, userData?.toJson());
  }

  Map<String, dynamic> readLoginInfo() {
    return box.read(LOGIN_INFORMATION);
  }

  Future<void> removeLoginInfo() async {
    await box.remove(LOGIN_INFORMATION);
  }
  // End Of Data User

  // Data Autentikasi
  Future<void> saveIsAuthenticated(bool? loginStatus) async {
    return box.write(LOGIN_STATUS, loginStatus);
  }

  Future<bool?> readIsAuthenticated() async {
    return box.read(LOGIN_STATUS);
  }

  Future<void> removeIsAuthenticated() async {
    return box.remove(LOGIN_STATUS);
  }
  // End Of Autentikasi

  // Data Autentikasi
  Future<void> saveIsAdmin(bool? isAdmin) async {
    return box.write(ROLE_STATUS, isAdmin);
  }

  bool readIsAdmin() {
    return box.read(ROLE_STATUS);
  }

  Future<void> removeIsAdmin() async {
    return box.remove(ROLE_STATUS);
  }
  // End Of Autentikasi
}
