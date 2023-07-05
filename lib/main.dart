import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:uniname/routes/app_pages.dart';

import 'routes/app_routes.dart';
import 'view_model_binding/view_model_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      },
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "University Names",
      initialBinding: ViewModelBinding(),
      initialRoute: AppRoutes.NAME_LIST_SCREEN,
      getPages: AppPages.list,
      builder: EasyLoading.init(),
    );
  }
}
