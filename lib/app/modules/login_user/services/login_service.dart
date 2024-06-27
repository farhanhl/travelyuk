import 'dart:convert';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/error_model.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/models/submit_login_model.dart';
import 'package:travelyuk/app/utils/app_const.dart';

class LoginService {
  Api api;
  LoginService(this.api);

  Future<GetLogin> login(SubmitLogin userData) {
    return api.login(userData).then((value) {
      return GetLogin.fromJson(value.data);
    }).catchError(
      (e) {
        ErrorModel showr = ErrorModel();
        bool isJSON() {
          try {
            showr = ErrorModel.fromJson(json.decode("${e.response}"));
            return true;
          } catch (e) {
            return false;
          }
        }

        throw isJSON() ? showr.message! : DEFAULT_ERROR_MESSAGE;
      },
    );
  }
}
