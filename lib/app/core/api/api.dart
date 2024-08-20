import 'package:dio/dio.dart';
import 'package:travelyuk/app/models/submit_login_model.dart';
import 'package:travelyuk/app/models/submit_order_model.dart';
import 'package:travelyuk/app/models/submit_register_model.dart';
import 'package:travelyuk/app/models/submit_schedule_model.dart';
import 'package:travelyuk/app/models/submit_search_schedule_model.dart';

const baseUrl = 'https://harapanjaya.xyz/api';
// const baseUrl = 'http://10.0.2.2:8000/api';

class Api {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      contentType: Headers.jsonContentType,
    ),
  );

  Future<Response> register(SubmitRegister userData) {
    return dio.post("/register", data: userData);
  }

  Future<Response> login(SubmitLogin userData) {
    return dio.post("/login", data: userData);
  }

  Future<Response> getCities() {
    return dio.get("/get_cities");
  }

  Future<Response> getSchedules() {
    return dio.get("/get_schedules");
  }

  // Orders
  Future<Response> getOrders() {
    return dio.get("/get_orders");
  }

  Future<Response> getOrdersByUser(int id) {
    return dio.get("/get_orders/$id");
  }

  Future<Response> changeStatus(int id, String status) {
    return dio.put("/change_status/$id", data: {"status": status});
  }

  Future<Response> getOrder(int id) {
    return dio.get("/get_order/$id");
  }
  // End Of Orders Section

  Future<Response> searchSchedule(SubmitSearchSchedule submitSearchSchedule) {
    return dio.post("/search_schedules", data: submitSearchSchedule);
  }

  Future<Response> addSchedule(SubmitSchedule submitSchedule) {
    return dio.post("/add_schedule", data: submitSchedule);
  }

  Future<Response> addOrder(SubmitOrder submitOrder) {
    return dio.post("/add_order", data: submitOrder);
  }

  Future<Response> upload(file, id) async {
    final formData = FormData.fromMap({
      'transfer': await MultipartFile.fromFile(file, filename: file),
    });

    return dio.post("/payment_proof/$id", data: formData);
  }
}
