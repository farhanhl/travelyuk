import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:travelyuk/app/modules/order_admin/views/order_admin_view.dart';
import 'package:travelyuk/app/modules/bus_schedule_admin/views/bus_schedule_admin_view.dart';
import 'package:travelyuk/app/modules/dashboard_admin/controllers/dashboard_admin_controller.dart';

class DashboardAdminView extends GetView<DashboardAdminController> {
  const DashboardAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardAdminController>(
      init: DashboardAdminController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomWidget.appBar(
            isAdmin: true,
            signOutFunction: () => controller.doLogOut(),
          ),
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text(
                "Tekan lagi untuk keluar.",
              ),
            ),
            child: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: const [
                  OrderAdminView(),
                  BusScheduleAdminView(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: shadowColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.list),
                label: 'Daftar Pesanan',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.list),
                label: 'Daftar Jadwal',
              ),
            ],
          ),
        );
      },
    );
  }
}
