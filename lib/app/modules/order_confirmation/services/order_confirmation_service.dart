import 'dart:convert';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import 'package:travelyuk/app/models/error_model.dart';
import 'package:travelyuk/app/models/submit_order_model.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';

class OrderConfirmationService {
  Api api;
  OrderConfirmationService(this.api);

  Future<GetSchedules> addOrder(SubmitOrder submitOrder) {
    return api.addOrder(submitOrder).then((value) {
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
}
