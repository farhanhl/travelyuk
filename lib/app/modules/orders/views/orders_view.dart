import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/menu_models.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Pesanan",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Divider(
                  indent: 2,
                  color: darkColor,
                ),
                ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: controller.orderHistory?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Menu.orderHistory(
                      controller.orderHistory?[index],
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
