import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/core/common/widgets/custom_secondary_button.dart';
import 'package:dris_edward/features/auth/verification/controller/verification_controller.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final VerificationController verificationController = Get.put(
    VerificationController(),
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
                Center(
                  child: Image.asset(
                    Imagepath.verificationImage,
                    height: 262,
                    width: 238,
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Verification',
                    style: getHeadingTextStyle().copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "A verification code has been sent to your email. Enter the OTP to proceed.",
                    textAlign: TextAlign.center,
                    style: getNormalTextStyle().copyWith(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Pinput(
                    controller: verificationController.pinController,
                    focusNode: verificationController.focusNode,
                    length: 4,
                    defaultPinTheme: PinTheme(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      textStyle: getNormalTextStyle().copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttonBackgroundColor,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.buttonBackgroundColor,
                        ),
                      ),
                    ),
                    // focusedPinTheme: PinTheme(
                    //   width: 50,
                    //   height: 56,
                    //   textStyle: getNormalTextStyle().copyWith(
                    //     color: AppColors.buttonBackgroundColor,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //     border: Border.all(
                    //       color: AppColors.buttonBackgroundColor,
                    //     ),
                    //   ),
                    // ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the verification code';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 80),
                CustomPrimaryButton(
                  buttonText: 'Continue',
                  buttonColor: AppColors.buttonBackgroundColor,
                  onTap: () {
                    // verificationController.verifyCode();
                    Get.toNamed(AppRoute.createNewPasswordScreen);
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
