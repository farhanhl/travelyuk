import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelyuk/app/modules/home/views/home_view.dart';
import 'package:travelyuk/app/modules/orders/views/orders_view.dart';
import 'package:travelyuk/app/modules/profile/views/profile_view.dart';
import 'package:travelyuk/app/theme/app_theme.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomWidget.appBar(),
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
                  HomeView(),
                  OrdersView(),
                  ProfileView(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.list),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.person),
                label: 'Akun',
              ),
            ],
          ),
        );
      },
    );
  }
}
