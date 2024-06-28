import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/menu_models.dart';
import '../controllers/order_admin_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderAdminView extends GetView<OrderAdminController> {
  const OrderAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderAdminController>(
      init: OrderAdminController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Pesanan",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Divider(
                  indent: 2,
                  color: darkColor,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.orderHistory?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Menu.orderHistory(
                        controller.orderHistory?[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
