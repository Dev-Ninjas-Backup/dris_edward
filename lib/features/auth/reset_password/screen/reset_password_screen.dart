import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/custom_textfield.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/core/common/widgets/custom_secondary_button.dart';
import 'package:dris_edward/features/auth/reset_password/controller/reset_password_controller.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController resetPasswordController = Get.put(
    ResetPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 59),
                Image.asset(
                  Imagepath.resetPasswordImage,
                  height: 243,
                  width: 376,
                ),
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Reset your password',
                    style: getHeadingTextStyle().copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "Enter your email we'll send you a OTP to reset your password",
                    textAlign: TextAlign.center,
                    style: getNormalTextStyle().copyWith(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Email Or Phone',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: resetPasswordController.emailOrPhoneController,
                  hintText: 'Enter your email or phone',
                ),
                const SizedBox(height: 50),
                CustomPrimaryButton(
                  buttonText: 'Send',
                  buttonColor: AppColors.buttonBackgroundColor,
                  onTap: () {
                    // resetPasswordController.sendResetLink();
                    Get.toNamed(AppRoute.getVerificationScreen());
                  },
                ),
                const SizedBox(height: 20),
                CustomSecondaryButton(
                  buttonText: "Cancel",
                  buttonColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
