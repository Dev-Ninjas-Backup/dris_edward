import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final fullNameController = TextEditingController();
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Placeholder for future signup logic
  Future<void> signup() async {}

  @override
  void onClose() {
    fullNameController.dispose();
    emailOrPhoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
