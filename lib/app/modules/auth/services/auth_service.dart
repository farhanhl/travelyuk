import 'package:get_storage/get_storage.dart';
import 'package:travelyuk/utils/app_const.dart';

class AuthCacheService {
  final box = GetStorage();

  Future<bool> saveLogininfo(String? token) async {
    await box.remove(LOGIN_INFORMATION);
    await box.write(LOGIN_INFORMATION, token);
    return true;
  }

  Map<String, dynamic> readLoginInfo() {
    return box.read(LOGIN_INFORMATION);
  }

  Future<void> removeLoginInfo() async {
    await box.remove(LOGIN_INFORMATION);
  }
}
