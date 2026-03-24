import 'dart:async';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:get/get.dart';
//import 'package:dris_edward/core/service/local_service/shared_preference_helper.dart';

class SplashController extends GetxController {
  //final pref = Get.put(SharedPreferencesHelperController());

  var progressIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (progressIndex.value < 2) {
        progressIndex.value++;
      } else {
        timer.cancel();
        Get.offAllNamed(AppRoute.onboarding1);
      }
    });
  }
}
