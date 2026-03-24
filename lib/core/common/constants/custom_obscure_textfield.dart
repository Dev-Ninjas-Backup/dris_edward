import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';

class CustomObsecureTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const CustomObsecureTextfield({
    super.key,
    this.controller,
    this.hintText = 'Enter your password',
  });

  @override
  Widget build(BuildContext context) {
    final obsecureController = Get.put(CustomObsecureTextfieldController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.buttonBackgroundColor),
      ),
      child: Obx(() {
        return TextField(
          controller: controller,
          obscureText: obsecureController.isObscure.value,
          style: getNormalTextStyle().copyWith(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: getNormalTextStyle().copyWith(color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                obsecureController.isObscure.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: obsecureController.toggle,
            ),
          ),
        );
      }),
    );
  }
}

class CustomObsecureTextfieldController extends GetxController {
  final isObscure = true.obs;
  void toggle() => isObscure.value = !isObscure.value;
}
