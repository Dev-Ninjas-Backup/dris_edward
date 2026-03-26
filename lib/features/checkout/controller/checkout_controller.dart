import 'package:dris_edward/routes/app_routes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final selectedDeliveryMethod = 'pickup'.obs;

  void selectDeliveryMethod(String method) {
    selectedDeliveryMethod.value = method;
    continueCheckout();
  }

  void continueCheckout() {
    Get.toNamed(AppRoute.addToCartScreen);
  }
}
