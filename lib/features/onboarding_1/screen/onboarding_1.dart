import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/imagepath.dart';
import '../../../core/common/style/global_text_style.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Inner stack: top image + white card over it
            Stack(
              children: [
                // TOP IMAGE (covers upper part of screen)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: height * 0.6,
                  child: Image.asset(
                    Imagepath.onboarding1Image,
                    fit: BoxFit.cover,
                  ),
                ),

                // WHITE CARD SECTION positioned over image and going down
                Positioned(
                  top: height * 0.45,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipPath(
                    clipper: WhiteClipper(),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //SizedBox(height: 40.h),

                          // Text Content
                          Column(
                            children: [
                              SizedBox(height: 63.h),
                              Text(
                                "Craving Something\nDelicious?",
                                textAlign: TextAlign.center,
                                style: getHeadingTextStyle(
                                  fontsize: 26,
                                  fontweight: FontWeight.w700,
                                ).copyWith(color: const Color(0xFF0B3D0B)),
                              ),
                              SizedBox(height: 0.h),
                              Text(
                                "Explore freshly prepared meals from our kitchen and order your favourites in just a few taps.",
                                textAlign: TextAlign.center,
                                style: getNormalTextStyle().copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 145.h),
                            ],
                          ),

                          /// 🔘 DOTS AND ARROW AT BOTTOM
                          Padding(
                            padding: EdgeInsets.only(bottom: 50.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [dot(true), dot(false), dot(false)],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // GREEN PNG SHAPE at bottom-right of entire screen
            Positioned(
              bottom: 0,
              right: 0,
              child: Stack(
                children: [
                  Image.asset(
                    Imagepath.onboardingVector,
                    width: width * 0.47,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 50.h,
                    right: 16.w,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.onboarding2);
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DOT INDICATOR

Widget dot(bool isActive) {
  return Container(
    margin: EdgeInsets.only(right: 8.w),
    width: isActive ? 40.w : 17.w,
    height: 8.h,
    decoration: BoxDecoration(
      color: isActive ? const Color(0xFF1B5E20) : const Color(0xFFD0D0D0),
      borderRadius: BorderRadius.circular(4.r),
    ),
  );
}

// WHITE CLIPPER

class WhiteClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top left
    path.moveTo(0, 80);

    // Create a smooth curve at the top
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, 80);

    // Continue to bottom right
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
