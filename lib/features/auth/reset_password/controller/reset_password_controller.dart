import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final emailOrPhoneController = TextEditingController();

  // Placeholder for future reset-password logic (send OTP, etc.)
  Future<void> sendResetLink() async {}

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    super.onClose();
  }
}
