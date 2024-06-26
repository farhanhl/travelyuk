import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:travelyuk/app/theme/app_theme.dart';

class Menu {
  static Widget orderHistory(MenuModel? menuModel) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: primaryColor,
      child: ListTile(
        onTap: menuModel?.onTap,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.bus,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  menuModel?.busName ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: lightColor,
                  ),
                ),
              ],
            ),
            Text(
              formatDate(menuModel?.date ?? ""),
              style: TextStyle(
                fontSize: 14.sp,
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
                const FaIcon(
                  FontAwesomeIcons.mapLocationDot,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "${menuModel?.from}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColor,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "${menuModel?.to}",
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
                const FaIcon(
                  FontAwesomeIcons.tag,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "Rp. ${menuModel?.price}",
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
                const FaIcon(
                  FontAwesomeIcons.userLarge,
                  size: 16,
                  color: lightColor,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "${menuModel?.pax}",
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

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = DateFormat('d MMMM y', 'id_ID').format(dateTime);
  return formattedDate;
}
