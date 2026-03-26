import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  var selectedPaymentMethod = 'cash'.obs;
  var streetHouseNumber = TextEditingController();
  var apartment = TextEditingController();
  var noteToRider = TextEditingController();
  var phoneNumber = TextEditingController();
  var name = TextEditingController();

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  @override
  void onClose() {
    streetHouseNumber.dispose();
    apartment.dispose();
    noteToRider.dispose();
    phoneNumber.dispose();
    name.dispose();
    super.onClose();
  }
}
