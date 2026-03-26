import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCustomObsecureTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const ProfileCustomObsecureTextfield({
    super.key,
    this.controller,
    this.hintText = 'Enter your password',
  });

  @override
  Widget build(BuildContext context) {
    final obscureController = Get.put(
      _ProfileObscureController(),
      tag: controller.hashCode.toString(),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() {
        return TextField(
          controller: controller,
          obscureText: obscureController.isObscure.value,
          style: getNormalTextStyle().copyWith(
            color: Colors.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: getNormalTextStyle().copyWith(
              color: const Color(0xFFB3B3B3),
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: obscureController.toggle,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(
                  obscureController.isObscure.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFFB3B3B3),
                  size: 20,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ProfileObscureController extends GetxController {
  RxBool isObscure = true.obs;

  void toggle() {
    isObscure.value = !isObscure.value;
  }
}
