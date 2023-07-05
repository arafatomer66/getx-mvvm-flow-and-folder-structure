import 'package:get/get.dart';
import 'package:uniname/view_model/dashboard_view_model.dart';


class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardViewModel(), fenix: true);

    Get.put(DashboardViewModel());
  }
}
