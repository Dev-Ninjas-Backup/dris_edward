import 'package:get/instance_manager.dart';
import 'package:dris_edward/features/splash/controller/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
