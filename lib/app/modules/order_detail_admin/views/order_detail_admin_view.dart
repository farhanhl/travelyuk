import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_detail_admin/controllers/order_detail_admin_controller.dart';
import 'package:travelyuk/app/modules/order_detail_admin/services/order_detail_admin_service.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_func.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';

class OrderDetailAdminView extends GetView<OrderDetailAdminController> {
  const OrderDetailAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailAdminController>(
      init: OrderDetailAdminController(
        OrderDetailAdminService(
          Get.find<Api>(),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          appBar: CustomWidget.appBar(isLeading: true),
          body: controller.isLoading
              ? const SizedBox.shrink()
              : SingleChildScrollView(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Detail Pesanan",
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
                      SizedBox(height: 10.h),
                      Container(
                        width: Get.width.w,
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${controller.order.schedule?.busName}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Tanggal: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatDate(
                                        controller.order.schedule?.date ?? ""),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Jam Keberangkatan: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatTime(controller
                                            .order.schedule?.departureTime ??
                                        ""),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Kota Awal: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "${controller.order.schedule?.originCity?.name}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Kota Tujuan: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "${controller.order.schedule?.destinationCity?.name}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Harga: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatCurrency(
                                        controller.order.price ?? ""),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Status Pembayaran: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: getPaymentStatus(
                                      isPaid:
                                          (controller.order.isPaid ?? false),
                                      isPaymentAccepted:
                                          (controller.order.isPaymentAccepted ??
                                              false),
                                      isRefund:
                                          (controller.order.isRefund ?? false),
                                      isRefundAccepted:
                                          (controller.order.isRefundAccepted ??
                                              false),
                                    ),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Total Penumpang: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller.order.pax,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      (controller.order.isPaid ?? true) == true &&
                              (controller.order.isPaymentAccepted ?? false) ==
                                  false
                          ? ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color?>(
                                  primaryColor,
                                ),
                              ),
                              onPressed: () => controller
                                  .changeIsPaid("is_payment_accepted"),
                              child: const Text(
                                "Konfirmasi Pembayaran",
                                style: TextStyle(
                                  color: lightColor,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      isRefundable(
                        isPaid: controller.order.isPaid ?? false,
                        isPaymentAccepted:
                            controller.order.isPaymentAccepted ?? false,
                        isRefund: controller.order.isRefund ?? false,
                        isRefundAccepted:
                            controller.order.isRefundAccepted ?? false,
                        isAdmin: true,
                        date: controller.order.schedule?.date ?? "",
                        departureTime:
                            controller.order.schedule?.departureTime ?? "",
                      )
                          ? ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color?>(
                                        primaryColor),
                              ),
                              onPressed: () =>
                                  controller.changeIsPaid("is_refund_accepted"),
                              child: const Text(
                                "Terima pengembalian dana",
                                style: TextStyle(
                                  color: lightColor,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
        );
      },
    );
  }
}
