import 'dart:convert';
import 'dart:developer';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import 'package:travelyuk/app/models/error_model.dart';

class OrderDetailService {
  Api api;
  OrderDetailService(this.api);

  Future<dynamic> changeIsPaid(int id, String status) {
    return api.changeStatus(id, status).then((value) {
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

  Future<Order> getOrder(int id) {
    return api.getOrder(id).then((value) {
      log("======================================");
      log(jsonEncode(value.data));
      log("======================================");
      return Order.fromJson(value.data);
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
