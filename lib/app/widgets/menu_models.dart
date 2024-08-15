import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/models/get_orders_model.dart';
import 'package:travelyuk/app/utils/app_func.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelyuk/app/models/get_schedules_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu {
  static Widget scheduleHistory(
    Schedules? schedule,
    bool isSearchResult,
  ) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: primaryColor,
      child: ListTile(
        onTap: () => isSearchResult
            ? Get.toNamed(Routes.ORDER_CONFIRMATION, arguments: schedule)
            : null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.bus,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  schedule?.busName ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Text(
              formatDate(schedule?.date ?? ""),
              style: TextStyle(
                fontSize: 16.sp,
                color: lightColor,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.mapLocationDot,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "${schedule?.originCity?.name}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "${schedule?.destinationCity?.name}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                const Icon(
                  FontAwesomeIcons.tag,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  formatCurrency(schedule?.price ?? ""),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                const Icon(
                  FontAwesomeIcons.clock,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  schedule?.departureTime ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget orderHistory(Order? order, bool isAdmin) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: primaryColor,
      child: ListTile(
        onTap: () => isAdmin
            ? Get.toNamed(Routes.ORDER_DETAIL_ADMIN, arguments: order)
            : Get.toNamed(Routes.ORDER_DETAIL, arguments: order),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.bus,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  order?.schedule?.busName ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Text(
              formatDate(order?.schedule?.date ?? ""),
              style: TextStyle(
                fontSize: 16.sp,
                color: lightColor,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.mapLocationDot,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "${order?.schedule?.originCity?.name}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "${order?.schedule?.destinationCity?.name}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                const Icon(
                  FontAwesomeIcons.tag,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  formatCurrency(order?.price ?? ""),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                const Icon(
                  FontAwesomeIcons.signsPost,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  getIsOneWay(order?.isOneWay ?? false),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                const Icon(
                  FontAwesomeIcons.userLarge,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "${order?.pax} ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static seat(int index) {
    return GestureDetector(
      // onTap: () => ,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            "${index + 1}",
            style: const TextStyle(color: lightColor),
          ),
        ),
      ),
    );
  }
}

class MenuModel {
  String? from;
  String? to;
  String? price;
  String? date;
  String? busName;
  String? pax;
  VoidCallback? onTap;

  MenuModel({
    required this.from,
    required this.to,
    required this.price,
    required this.date,
    required this.busName,
    required this.pax,
    required this.onTap,
  });
}
