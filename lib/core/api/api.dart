import 'package:dio/dio.dart';

const baseUrl = 'https://api-dev.gmf-aeroasia.co.id/utils/sap';

class Api {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'x-api-key': 'CAD2-4CEA-99AE-314C'},
      contentType: Headers.jsonContentType,
    ),
  );

  // Employee Data API
  Future<Response> getEmployee() {
    return dio.get("/th/soev2/v2/employee?page=1&perPage=10000");
  }
}
