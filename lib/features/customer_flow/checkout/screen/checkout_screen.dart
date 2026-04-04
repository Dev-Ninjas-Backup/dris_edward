import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/customer_flow/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF53B453), Colors.white, Colors.white],
          stops: [0.1, 0.4, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            'Checkout',
            style: getHeadingTextStyle(
              fontsize: 24,
              fontweight: FontWeight.w700,
            ).copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  /// Main heading
                  Text(
                    'How would you like to order?',
                    style: getNormalTextStyle(
                      fontsize: 24,
                      fontweight: FontWeight.w600,
                    ).copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  /// Subheading
                  Text(
                    'Choose your preferred method.',
                    style: getNormalTextStyle(
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                    ).copyWith(color: Colors.black54),
                  ),
                  const SizedBox(height: 32),

                  /// Delivery Method Options
                  Obx(
                    () => Column(
                      children: [
                        /// Pickup Option
                        GestureDetector(
                          onTap: () =>
                              controller.selectDeliveryMethod('pickup'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color:
                                    controller.selectedDeliveryMethod.value ==
                                        'pickup'
                                    ? AppColors.buttonBackgroundColor
                                    : Colors.grey.shade300,
                                width:
                                    controller.selectedDeliveryMethod.value ==
                                        'pickup'
                                    ? 3
                                    : 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 36,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonBackgroundColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        Iconpath.basketIcon,
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Pickup',
                                  style: getNormalTextStyle(
                                    fontsize: 22,
                                    fontweight: FontWeight.w500,
                                  ).copyWith(color: Colors.black),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Pick up your order at a store\nnearby',
                                  textAlign: TextAlign.center,
                                  style: getNormalTextStyle(
                                    fontsize: 16,
                                    fontweight: FontWeight.w400,
                                  ).copyWith(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        /// Delivery Option
                        GestureDetector(
                          onTap: () =>
                              controller.selectDeliveryMethod('delivery'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color:
                                    controller.selectedDeliveryMethod.value ==
                                        'delivery'
                                    ? AppColors.buttonBackgroundColor
                                    : Colors.grey.shade300,
                                width:
                                    controller.selectedDeliveryMethod.value ==
                                        'delivery'
                                    ? 3
                                    : 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 36,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonBackgroundColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        Iconpath.bycycleIcon,
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Delivery',
                                  style: getNormalTextStyle(
                                    fontsize: 22,
                                    fontweight: FontWeight.w500,
                                  ).copyWith(color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'We\'ll bring your order to you',
                                  textAlign: TextAlign.center,
                                  style: getNormalTextStyle(
                                    fontsize: 16,
                                    fontweight: FontWeight.w400,
                                  ).copyWith(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
