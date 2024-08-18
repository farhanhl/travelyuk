import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import 'package:travelyuk/app/models/error_model.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/models/submit_schedule_model.dart';

class AddScheduleAdminService {
  Api api;
  AddScheduleAdminService(this.api);

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

  Future<dynamic> addSchedule(SubmitSchedule submitSchedule) {
    return api.addSchedule(submitSchedule).then((value) {
      return value.data;
    }).catchError(
      (e) {
        ErrorModel errorHandler = ErrorModel();
        bool isJSON() {
          try {
            errorHandler = ErrorModel.fromJson(json.decode("${e.response}"));
            return true;
          } catch (e) {
            return false;
          }
        }

        throw isJSON() ? errorHandler.message! : DEFAULT_ERROR_MESSAGE;
      },
    );
  }
}
