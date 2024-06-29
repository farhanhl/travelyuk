import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_admin/services/orde_admin_service.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/menu_models.dart';
import '../controllers/order_admin_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderAdminView extends GetView<OrderAdminController> {
  const OrderAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderAdminController>(
      init: OrderAdminController(
        OrderAdminService(
          Get.find<Api>(),
        ),
      ),
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
                controller.isSuccess == false
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/error.png",
                              height: 150.h,
                              width: 150.w,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "Gagal memuat pesanan...",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color?>(
                                  primaryColor,
                                ),
                              ),
                              onPressed: () => controller.getOrdersByUser(),
                              child: const Text(
                                "Muat Ulang",
                                style: TextStyle(
                                  color: lightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : controller.isLoading == true
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoadingAnimationWidget.newtonCradle(
                                  color: primaryColor,
                                  size: 200,
                                ),
                                const Text(
                                  "Memuat daftar pesanan...",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )
                        : (controller.orders.orders?.isEmpty ?? true)
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/empty.png",
                                      height: 150.h,
                                      width: 150.w,
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      "Belum ada pesanan..",
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color?>(
                                          primaryColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          controller.getOrdersByUser(),
                                      child: const Text(
                                        "Muat Ulang",
                                        style: TextStyle(
                                          color: lightColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () => controller.getOrdersByUser(),
                                  child: ListView.builder(
                                    itemCount:
                                        controller.orders.orders?.length ?? 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Menu.orderHistory(
                                          controller.orders.orders?[index],
                                          true);
                                    },
                                  ),
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
