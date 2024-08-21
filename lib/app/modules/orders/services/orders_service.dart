import 'dart:convert';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import 'package:travelyuk/app/models/error_model.dart';

class OrdersService {
  Api api;
  OrdersService(this.api);

  Future<GetOrders> getOrdersByUser(int id) {
    return api.getOrdersByUser(id).then((value) {
      return GetOrders.fromJson(value.data);
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
