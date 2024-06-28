import 'package:get/get.dart';

import '../modules/add_schedule_admin/bindings/add_schedule_admin_binding.dart';
import '../modules/add_schedule_admin/views/add_schedule_admin_view.dart';
import '../modules/bus_schedule_admin/bindings/bus_schedule_admin_binding.dart';
import '../modules/bus_schedule_admin/views/bus_schedule_admin_view.dart';
import '../modules/bus_schedule_user/bindings/bus_schedule_user_binding.dart';
import '../modules/bus_schedule_user/views/bus_schedule_user_view.dart';
import '../modules/dashboard_admin/bindings/dashboard_admin_binding.dart';
import '../modules/dashboard_admin/views/dashboard_admin_view.dart';
import '../modules/dashboard_user/bindings/dashboard_admin_binding.dart';
import '../modules/dashboard_user/views/dashboard_user_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order_admin/bindings/order_admin_binding.dart';
import '../modules/order_admin/views/order_admin_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD_USER,
      page: () => const DashboardUserView(),
      binding: DashboardUserBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.BUS_SCHEDULE_USER,
      page: () => const BusScheduleUserView(),
      binding: BusScheduleUserBinding(),
    ),
    GetPage(
      name: _Paths.BUS_SCHEDULE_ADMIN,
      page: () => const BusScheduleAdminView(),
      binding: BusScheduleAdminBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_ADMIN,
      page: () => const OrderAdminView(),
      binding: OrderAdminBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SCHEDULE_ADMIN,
      page: () => const AddScheduleAdminView(),
      binding: AddScheduleAdminBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_ADMIN,
      page: () => const DashboardAdminView(),
      binding: DashboardAdminBinding(),
    ),
  ];
}
