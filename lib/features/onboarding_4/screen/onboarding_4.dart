import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagepath.onboarding4Image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'Delicious Food Delivered To You',
                  textAlign: TextAlign.center,
                  style: getHeadingTextStyle().copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Experience the freshest ingredients and fastest delivery in town.',
                textAlign: TextAlign.center,
                style: getNormalTextStyle().copyWith(color: Colors.white),
              ),
              SizedBox(height: 48),
              CustomPrimaryButton(
                buttonText: "Login or Signup",
                buttonColor: AppColors.buttonBackgroundColor,
                onTap: () {
                  Get.toNamed(AppRoute.loginScreen);
                },
              ),
              SizedBox(height: 11),
              CustomPrimaryButton(
                buttonText: "Continue as Guest",
                buttonColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(AppRoute.selectResturantScreen);
                },
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
