import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/custom_obscure_textfield.dart';
import 'package:dris_edward/core/common/constants/custom_textfield.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/features/auth/signup/controller/signup_controller.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController signupController = Get.put(SignupController());

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
                  child: Text(
                    'Create Your Account',
                    style: getHeadingTextStyle().copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Join us today and enjoy fast, easy, and secure food delivery.',
                    textAlign: TextAlign.center,
                    style: getNormalTextStyle().copyWith(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  'Full name',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: signupController.fullNameController,
                  hintText: 'Enter your full name',
                ),
                const SizedBox(height: 20),
                Text(
                  'Email or Phone',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: signupController.emailOrPhoneController,
                  hintText: 'Enter your email or phone',
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter Your Password',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomObsecureTextfield(
                  controller: signupController.passwordController,
                  hintText: 'Enter your password',
                ),
                const SizedBox(height: 20),
                Text(
                  'Confirm Your Password',
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                CustomObsecureTextfield(
                  controller: signupController.confirmPasswordController,
                  hintText: 'Confirm your password',
                ),
                const SizedBox(height: 40),
                CustomPrimaryButton(
                  buttonText: 'Create account',
                  buttonColor: AppColors.buttonBackgroundColor,
                  onTap: () {
                    // signupController.signup();
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: getNormalTextStyle().copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.loginScreen);
                        },
                        child: Text(
                          'Login',
                          style: getNormalTextStyle().copyWith(
                            color: AppColors.buttonBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
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
