import 'package:dio/dio.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/models/get_login_model.dart';
import 'package:travelyuk/app/models/submit_login_model.dart';

class HomeService {
  Api api;
  HomeService(this.api);

  Future<GetLogin> doSearchBus(SubmitLogin userData) {
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

  Future<GetCities> getCities() {
    return api.getCities().then((value) {
      return GetCities.fromJson(value.data);
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
