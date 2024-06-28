import 'package:date_field/date_field.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/core/api/api.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelyuk/app/models/get_cities_model.dart';
import 'package:travelyuk/app/modules/add_schedule_admin/controllers/add_schedule_admin_controller.dart';
import 'package:travelyuk/app/modules/add_schedule_admin/services/add_schedule_admin_service.dart';

class AddScheduleAdminView extends GetView<AddScheduleAdminController> {
  const AddScheduleAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddScheduleAdminController>(
      init: AddScheduleAdminController(
        AddScheduleAdminService(
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
                Text(
                  "Jadwal",
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
                SizedBox(
                  height: 10.h,
                ),
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
                    selectedItem?.name ?? controller.destinationCity ?? "",
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
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Jam",
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: controller.time,
                        onChange: (value) => controller.changeTime(value),
                      ),
                    );
                  },
                  child: TextFormField(
                    controller: controller.departureTimeController,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Nama Bis",
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
                TextFormField(
                  controller: controller.busNameController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => controller.update(),
                  textInputAction: TextInputAction.next,
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
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Harga",
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
                TextFormField(
                  controller: controller.priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) => controller.update(),
                  textInputAction: TextInputAction.send,
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
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(
                            controller.isAllFilled()
                                ? primaryColor
                                : shadowColor,
                          ),
                        ),
                        onPressed: () {
                          controller.isAllFilled()
                              ? controller.addSchedule(
                                  inputedOriginCityId:
                                      controller.originCityId ?? 0,
                                  inputedDestinationCityId:
                                      controller.destinationCityId ?? 0,
                                  inputedDate: controller.date ?? "",
                                  inputedDepartureTime:
                                      controller.departureTimeController.text,
                                  inputedBusName:
                                      controller.busNameController.text,
                                  inputedPrice: double.parse(
                                    controller.priceController.text,
                                  ),
                                )
                              : null;
                        },
                        child: const Text(
                          "Tambah Jadwal",
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
        );
      },
    );
  }
}
