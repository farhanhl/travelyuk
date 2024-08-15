import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/utils/app_func.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import '../controllers/order_detail_controller.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelyuk/app/modules/order_detail/services/order_detail_service.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      init: OrderDetailController(
        OrderDetailService(
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
                                    text: "Tipe pesanan: ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: getIsOneWay(
                                        controller.order.isOneWay ?? false),
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
                      (controller.order.isPaid ?? false)
                          ? const SizedBox.shrink()
                          : SizedBox(
                              child: Column(
                                children: [
                                  CustomWidget.paymentInformation(
                                      controller.order.price ?? ""),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color?>(
                                        primaryColor,
                                      ),
                                    ),
                                    onPressed: () =>
                                        controller.changeIsPaid("is_paid"),
                                    child: const Text(
                                      "Saya sudah membayar",
                                      style: TextStyle(
                                        color: lightColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      isRefundable(
                        isPaid: controller.order.isPaid ?? false,
                        isPaymentAccepted:
                            controller.order.isPaymentAccepted ?? false,
                        isRefund: controller.order.isRefund ?? false,
                        isRefundAccepted:
                            controller.order.isRefundAccepted ?? false,
                        isAdmin: false,
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
                                  controller.changeIsPaid("is_refund"),
                              child: const Text(
                                "Ajukan pengembalian dana",
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
