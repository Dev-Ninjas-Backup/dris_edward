import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/customer_flow/cart/controller/cart_controller.dart';
import 'package:dris_edward/features/customer_flow/cart/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header - My Cart title
                  Center(
                    child: Text(
                      'My Cart',
                      style: getHeadingTextStyle(
                        fontsize: 24,
                        fontweight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// Cart Items
                  Obx(
                    () => controller.cartItems.isEmpty
                        ? Center(
                            child: Text(
                              'Your cart is empty',
                              style: getNormalTextStyle(
                                fontsize: 16,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.grey),
                            ),
                          )
                        : Column(
                            children: List.generate(
                              controller.cartItems.length,
                              (index) => CartItemCard(
                                item: controller.cartItems[index],
                                controller: controller,
                              ),
                            ),
                          ),
                  ),

                  const SizedBox(height: 20),

                  /// Add More Items
                  Center(
                    child: GestureDetector(
                      onTap: () => controller.addMoreItems(),
                      child: Text(
                        '+ Add more items',
                        style: getNormalTextStyle(
                          fontsize: 16,
                          fontweight: FontWeight.w500,
                        ).copyWith(color: AppColors.buttonBackgroundColor),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// Price Breakdown
                  Obx(
                    () => Column(
                      children: [
                        /// Subtotal
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black87),
                            ),
                            Text(
                              '\$${controller.subtotal.value.toStringAsFixed(2)}',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// Delivery
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black87),
                            ),
                            Text(
                              '\$${controller.deliveryFee.toStringAsFixed(2)}',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// Service Fee
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Service fee',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black87),
                            ),
                            Text(
                              '\$${controller.serviceFee.toStringAsFixed(2)}',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        /// Divider
                        Container(height: 1, color: Colors.grey.shade300),
                        const SizedBox(height: 14),

                        /// Total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: getNormalTextStyle(
                                fontsize: 18,
                                fontweight: FontWeight.w600,
                              ).copyWith(color: Colors.black),
                            ),
                            Text(
                              '\$${controller.totalPrice.value.toStringAsFixed(2)}',
                              style: getNormalTextStyle(
                                fontsize: 18,
                                fontweight: FontWeight.w600,
                              ).copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 60),

                  /// Checkout Button
                  GestureDetector(
                    onTap: () => controller.checkout(),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.buttonBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: getNormalTextStyle(
                            fontsize: 18,
                            fontweight: FontWeight.w600,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
