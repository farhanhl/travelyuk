import 'package:dio/dio.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/submit_register_model.dart';

class RegisterService {
  Api api;
  RegisterService(this.api);

  Future<dynamic> register(SubmitRegister userData) {
    return api.register(userData).then((value) {
      return value.data;
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
