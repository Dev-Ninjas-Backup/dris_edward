import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  // Placeholder for future verification logic
  Future<void> verifyCode() async {}

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
