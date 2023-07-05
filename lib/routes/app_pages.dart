

import 'package:get/get.dart';
import 'package:uniname/view/dashboard_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.NAME_LIST_SCREEN,
      page: () => DashboardScreenScreen(),
    )
  ];
}
