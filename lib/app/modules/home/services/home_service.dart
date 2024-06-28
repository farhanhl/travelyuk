import 'package:dio/dio.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';
import 'package:travelyuk/app/models/submit_search_schedule_model.dart';

class HomeService {
  Api api;
  HomeService(this.api);

  Future<GetSchedules> searchSchedule(
      SubmitSearchSchedule submitSearchSchedule) {
    return api.searchSchedule(submitSearchSchedule).then((value) {
      return GetSchedules.fromJson(value.data);
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
