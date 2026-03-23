import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_button.dart';
import 'package:dris_edward/features/onboarding_1/screen/onboarding_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagepath.splashImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            bottom: 111.0,
          ),
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
              SizedBox(height: 40),
              CustomPrimaryButton(
                buttonText: 'Get Started',
                onTap: () => Get.to(const Onboarding1()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
