import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/imagepath.dart';
import '../../../core/common/style/global_text_style.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Map<String, String>> onboardingData = [
    {
      'image': Imagepath.onboarding1Image,
      'title': 'Craving Something Delicious?',
      'description':
          'Explore freshly prepared meals from our kitchen and order your favourites in just a few taps.',
    },
    {
      'image': Imagepath.onboarding2Image,
      'title': 'Order in Seconds',
      'description':
          'Browse the menu, customize your meal, and place your order quickly and effortlessly.',
    },
    {
      'image': Imagepath.onboarding3Image,
      'title': 'Delivered Fresh to Your Door',
      'description':
          'We prepare your food with care and deliver it hot and fresh, right on time.',
    },
  ];

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    final size = MediaQuery.of(context).size;
    final height = size.height;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (controller.currentPage.value > 1) {
          controller.previousPage();
        } else {
          Get.back();
        }
      },
      child: Scaffold(
        body: Obx(() {
          final pageIndex = controller.currentPage.value - 1;
          final data = onboardingData[pageIndex];

          return SizedBox(
            height: height * 1,
            child: Stack(
              children: [
                /// TOP IMAGE
                Image.asset(
                  data['image']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                /// WHITE CARD
                Positioned(
                  top: height * 0.4,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipPath(
                    clipper: WhiteClipper(),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 100),

                          /// TEXT
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  data['title']!,
                                  textAlign: TextAlign.center,
                                  style: getHeadingTextStyle(
                                    fontsize: 26,
                                    fontweight: FontWeight.w700,
                                  ).copyWith(color: const Color(0xFF0B3D0B)),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  data['description']!,
                                  textAlign: TextAlign.center,
                                  style: getNormalTextStyle().copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// DOTS
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Row(
                              children: [
                                dot(controller.isActiveDot(1)),
                                dot(controller.isActiveDot(2)),
                                dot(controller.isActiveDot(3)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// GREEN SHAPE + ARROW
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Stack(
                    children: [
                      Image.asset(
                        Imagepath.onboardingVector,
                        width: 176,
                        height: 320,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.isLastPage()) {
                        controller.navigateToOnboarding4();
                      } else {
                        controller.nextPage();
                      }
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
          );
        }),
      ),
    );
  }
}

/// DOT
Widget dot(bool isActive) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    width: isActive ? 30 : 12,
    height: 6,
    decoration: BoxDecoration(
      color: isActive ? const Color(0xFF1B5E20) : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

/// CLIPPER
class WhiteClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 120);

    path.quadraticBezierTo(size.width / 2, -35, size.width, 120);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
