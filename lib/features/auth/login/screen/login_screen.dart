import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/core/common/constants/custom_obscure_textfield.dart';
import 'package:dris_edward/core/common/constants/custom_textfield.dart';
import 'package:dris_edward/features/auth/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

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
                    "Welcome back!",
                    style: getHeadingTextStyle().copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Log in to continue ordering your favorite meals anytime.",
                    textAlign: TextAlign.center,
                    style: getNormalTextStyle().copyWith(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  "Username or Email",
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 8),
                CustomTextfield(
                  controller: loginController.emailController,
                  hintText: 'Enter your email or username',
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: getNormalTextStyle(
                    fontsize: 18,
                    fontweight: FontWeight.w500,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 8),
                CustomObsecureTextfield(
                  controller: loginController.passwordController,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: loginController.rememberMe.value,
                            onChanged: loginController.toggleRememberMe,
                          ),
                          Text(
                            "Remember me",
                            style: getNormalTextStyle(
                              fontsize: 14,
                            ).copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: getNormalTextStyle().copyWith(
                          color: AppColors.buttonBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomPrimaryButton(
                  buttonText: "Sign In",
                  buttonColor: AppColors.buttonBackgroundColor,
                  onTap: () {
                    // loginController.login();
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "or",
                        style: getNormalTextStyle().copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFFE6EDE6),
                              child: Image.asset(Iconpath.google, height: 21),
                            ),
                          ),
                          const SizedBox(width: 26),
                          GestureDetector(
                            onTap: () async {},
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFFE6EDE6),
                              child: Image.asset(Iconpath.facebook, height: 21),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: getNormalTextStyle().copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Signup",
                          style: getNormalTextStyle(
                            fontsize: 14,
                            fontweight: FontWeight.w600,
                          ).copyWith(color: AppColors.buttonBackgroundColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
