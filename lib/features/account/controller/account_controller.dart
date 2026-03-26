import 'package:get/get.dart';

class AccountController extends GetxController {
  RxBool notificationsEnabled = false.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }
}
