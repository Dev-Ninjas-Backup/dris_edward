import 'package:dris_edward/core/binding/controller_binder.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.getSplashScreen(),
      getPages: AppRoute.routes,
      builder: EasyLoading.init(),
      initialBinding: ControllerBinder(),
      themeMode: ThemeMode.light,
    );
  }
}
