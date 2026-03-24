import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/custom_obscure_textfield.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/core/common/widgets/custom_secondary_button.dart';
import 'package:dris_edward/features/auth/create_new_password/controller/create_new_password_conroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  final CreateNewPasswordController createNewPasswordController = Get.put(
    CreateNewPasswordController(),
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
                    Imagepath.createNewPasswordImage,
                    height: 265,
                    width: 286,
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Create New Password',
                    style: getHeadingTextStyle().copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "Your New Password Must Be Different from Previously Used Password.",
                    textAlign: TextAlign.center,
                    style: getNormalTextStyle().copyWith(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Password',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomObsecureTextfield(
                  controller: createNewPasswordController.passwordController,
                  hintText: 'Create a password',
                ),
                const SizedBox(height: 20),
                Text(
                  'Re Type Password',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomObsecureTextfield(
                  controller:
                      createNewPasswordController.confirmPasswordController,
                  hintText: 'Confirm password',
                ),
                const SizedBox(height: 50),
                CustomPrimaryButton(
                  buttonText: 'Continue',
                  buttonColor: AppColors.buttonBackgroundColor,
                  onTap: () {
                    // resetPasswordController.sendResetLink();
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
