import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/error_model.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';
import 'package:travelyuk/app/models/submit_search_schedule_model.dart';
import 'package:travelyuk/app/utils/app_const.dart';

class HomeService {
  Api api;
  HomeService(this.api);

  Future<GetSchedules> searchSchedule(
      SubmitSearchSchedule submitSearchSchedule) {
    return api.searchSchedule(submitSearchSchedule).then((value) {
      return GetSchedules.fromJson(value.data);
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
