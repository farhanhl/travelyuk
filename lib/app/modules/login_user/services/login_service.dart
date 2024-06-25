import 'package:dio/dio.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/models/submit_login_model.dart';

class LoginService {
  Api api;
  LoginService(this.api);

  Future<GetLogin> login(SubmitLogin userData) {
    return api.login(userData).then((value) {
      return GetLogin.fromJson(value.data);
    }).catchError(
      (e) {
        throw Exception(
          e.runtimeType == DioException
              ? (e as DioException).error
              : "Terjadi Kesalahan: $e",
        );
      },
    );
  }
}
