import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Expanded(
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
                              "Travel Yuk",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF006298),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Expanded(
                    child: Image.asset(
                      "assets/images/bus.png",
                      width: 100.w,
                      height: 100.w,
                    ),
                  ),
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
                  Text(
                    "Kota Awal",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DropdownSearch<String>(
                    asyncItems: (value) => controller.getEmployee(),
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      itemBuilder: (context, item, isSelected) =>
                          const ListTile(
                        title: Text(
                          "-",
                        ),
                      ),
                    ),
                    // dropdownBuilder: (context, selectedItem) => Text(
                    //     selectedItem?.personalNumber ??
                    //         controller.selectedReceiverBy!),
                    onChanged: (value) {
                      // controller.changeNopeg(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Kota Tujuan",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DropdownSearch<String>(
                    asyncItems: (value) => controller.getEmployee(),
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      itemBuilder: (context, item, isSelected) =>
                          const ListTile(
                        title: Text(
                          "-",
                        ),
                      ),
                    ),
                    // dropdownBuilder: (context, selectedItem) => Text(
                    //     selectedItem?.personalNumber ??
                    //         controller.selectedReceiverBy!),
                    onChanged: (value) {
                      // controller.changeNopeg(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Tanggal",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    onChanged: (DateTime? value) {},
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color?>(
                              const Color(0xFF006298),
                            ),
                          ),
                          onPressed: () => null,
                          child: const Text(
                            "Cari Bus",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
