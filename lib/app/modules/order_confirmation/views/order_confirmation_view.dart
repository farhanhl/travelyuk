import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/modules/order_confirmation/services/order_confirmation_service.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelyuk/app/modules/order_confirmation/controllers/order_confirmation_controller.dart';
import 'package:travelyuk/app/utils/app_func.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';

class OrderConfirmationView extends GetView<OrderConfirmationController> {
  const OrderConfirmationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderConfirmationController>(
      init: OrderConfirmationController(
        OrderConfirmationService(
          Get.find<Api>(),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          appBar: CustomWidget.appBar(isLeading: true),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dapatkan Harga Termurah",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Hanya di ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                APP_NAME,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/bus.png",
                      width: 100.w,
                      height: 100.w,
                    ),
                  ],
                ),
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
                        "${controller.schedule.busName}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tanggal: ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          Text(
                            formatDate(controller.schedule.date ?? ""),
                            style: TextStyle(fontSize: 14.sp),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Jam Keberangkatan: ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            formatTime(controller.schedule.departureTime ?? ""),
                            style: TextStyle(fontSize: 14.sp),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Kota Awal: ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${controller.schedule.originCity?.name}",
                            style: TextStyle(fontSize: 14.sp),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Kota Tujuan: ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${controller.schedule.destinationCity?.name}",
                            style: TextStyle(fontSize: 14.sp),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Harga: ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            formatCurrency(controller.schedule.price ?? ""),
                            style: TextStyle(fontSize: 14.sp),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Form Pemesanan",
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
                Text(
                  "Nama",
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextFormField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  enabled: false,
                  decoration: InputDecoration(
                    fillColor: lightColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: shadowColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: shadowColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: shadowColor,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: shadowColor,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: const Color(0xFFb2b7bf),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Jumlah Kursi",
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.paxController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: lightColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: shadowColor,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: const Color(0xFFb2b7bf),
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        height: Get.height.h,
                        child: ElevatedButton(
                          onPressed: () => controller.setPax(false),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color?>(primaryColor),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          child: const Text(
                            "-",
                            style: TextStyle(color: lightColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        height: Get.height.h,
                        child: ElevatedButton(
                          onPressed: () => controller.setPax(true),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color?>(primaryColor),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          child: const Text(
                            "+",
                            style: TextStyle(color: lightColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: primaryColor,
                      value: controller.isOneWay,
                      onChanged: (value) {
                        controller.changeIsOneWay(value!);
                      },
                      visualDensity: VisualDensity.compact,
                    ),
                    Text(
                      "Pulang Pergi",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Harga: ${formatCurrency(controller.countTotal())}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => controller.doSubmitOrder(
                          pax: int.parse(controller.paxController.text),
                          price: controller.countTotal(),
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(
                            primaryColor,
                          ),
                        ),
                        child: const Text(
                          "Pesan",
                          style: TextStyle(color: lightColor),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
