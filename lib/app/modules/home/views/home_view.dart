import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/modules/home/services/home_service.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/utils/app_const.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(
        HomeService(
          Get.find<Api>(),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.sp),
            child: Column(
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(),
                  ),
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Kota Awal",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: errorColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      DropdownSearch<Cities>(
                        asyncItems: (value) => controller.getCities(),
                        popupProps: PopupProps.modalBottomSheet(
                          showSearchBox: true,
                          modalBottomSheetProps: ModalBottomSheetProps(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                            ),
                          ),
                          itemBuilder: (context, item, isSelected) => ListTile(
                            title: Text(
                              "${item.name}",
                            ),
                          ),
                        ),
                        dropdownBuilder: (context, selectedItem) => Text(
                          selectedItem?.name ?? controller.originCity ?? "",
                        ),
                        onChanged: (value) {
                          controller.changeCity(
                            isOrigin: true,
                            cityName: value?.name ?? "",
                            cityId: value?.id ?? 0,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Kota Tujuan",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: errorColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      DropdownSearch<Cities>(
                        asyncItems: (value) => controller.getCities(),
                        popupProps: PopupProps.modalBottomSheet(
                          showSearchBox: true,
                          modalBottomSheetProps: ModalBottomSheetProps(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                            ),
                          ),
                          itemBuilder: (context, item, isSelected) => ListTile(
                            title: Text(
                              "${item.name}",
                            ),
                          ),
                        ),
                        dropdownBuilder: (context, selectedItem) => Text(
                          selectedItem?.name ??
                              controller.destinationCity ??
                              "",
                        ),
                        onChanged: (value) {
                          controller.changeCity(
                            isOrigin: false,
                            cityName: value?.name ?? "",
                            cityId: value?.id ?? 0,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tanggal",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: errorColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8.w, top: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: shadowColor),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.event_note),
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          onChanged: (DateTime? value) {
                            controller.changeDate(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color?>(
                                  controller.isAllFilled()
                                      ? primaryColor
                                      : shadowColor,
                                ),
                              ),
                              onPressed: () {
                                controller.isAllFilled()
                                    ? controller.doSearchBus(
                                        inputedOriginCityId:
                                            controller.originCityId ?? 0,
                                        inputedDestinationCityId:
                                            controller.destinationCityId ?? 0,
                                        inputedDate: controller.date ?? "",
                                      )
                                    : null;
                              },
                              child: const Text(
                                "Cari Bus",
                                style: TextStyle(
                                  color: lightColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
