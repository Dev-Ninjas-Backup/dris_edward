import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/add_to_cart/controller/add_to_cart_controller.dart';
import 'package:dris_edward/features/add_to_cart/widgets/input_field.dart';
import 'package:dris_edward/features/add_to_cart/widgets/summary_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddToCartController());

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Title
                          Expanded(
                            child: Center(
                              child: Text(
                                'Review & Place Order',
                                style: getHeadingTextStyle(
                                  fontsize: 24,
                                  fontweight: FontWeight.w700,
                                ).copyWith(color: Colors.black),
                              ),
                            ),
                          ),

                          // Favorite Icon
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      /// Delivery Address Section
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF88DC88), Color(0xFFE9FFE9)],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Delivery Address',
                                      style: getNormalTextStyle(
                                        fontsize: 20,
                                        fontweight: FontWeight.w500,
                                      ).copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Edit',
                                    style:
                                        getNormalTextStyle(
                                          fontsize: 16,
                                          fontweight: FontWeight.w400,
                                        ).copyWith(
                                          color:
                                              AppColors.buttonBackgroundColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Road 71  Guisan 2',
                              style: getNormalTextStyle(
                                fontsize: 16,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.black),
                            ),

                            const SizedBox(height: 20),

                            /// Input Fields
                            InputField(
                              controller: controller.streetHouseNumber,
                              maxLines: 1,
                              hint: 'street/ House Number',
                            ),
                            const SizedBox(height: 12),
                            InputField(
                              controller: controller.apartment,
                              maxLines: 1,
                              hint: 'Apartment',
                            ),
                            const SizedBox(height: 12),
                            InputField(
                              controller: controller.noteToRider,
                              maxLines: 3,
                              hint: 'Note to rider',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      /// Payment Method Section
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Method',
                              style: getNormalTextStyle(
                                fontsize: 20,
                                fontweight: FontWeight.w500,
                              ).copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => Column(
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        controller.selectPaymentMethod('cash'),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        //horizontal: 16,
                                        vertical: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            controller
                                                    .selectedPaymentMethod
                                                    .value ==
                                                'cash'
                                            ? Color(0xFFE6EDE6)
                                            : Colors.white,
                                        border: Border.all(
                                          color:
                                              controller
                                                      .selectedPaymentMethod
                                                      .value ==
                                                  'cash'
                                              ? AppColors.buttonBackgroundColor
                                              : Colors.grey[300]!,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: 'cash',
                                            groupValue: controller
                                                .selectedPaymentMethod
                                                .value,
                                            onChanged: (_) => controller
                                                .selectPaymentMethod('cash'),
                                            activeColor:
                                                AppColors.buttonBackgroundColor,
                                          ),
                                          Text(
                                            'Cash on Delivery',
                                            style: getNormalTextStyle(
                                              fontsize: 16,
                                              fontweight: FontWeight.w400,
                                            ).copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  GestureDetector(
                                    onTap: () =>
                                        controller.selectPaymentMethod('card'),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        //horizontal: 12,
                                        vertical: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            controller
                                                    .selectedPaymentMethod
                                                    .value ==
                                                'card'
                                            ? Color(0xFFE6EDE6)
                                            : Colors.white,
                                        border: Border.all(
                                          color:
                                              controller
                                                      .selectedPaymentMethod
                                                      .value ==
                                                  'card'
                                              ? AppColors.buttonBackgroundColor
                                              : Colors.grey[300]!,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: 'card',
                                            groupValue: controller
                                                .selectedPaymentMethod
                                                .value,
                                            onChanged: (_) => controller
                                                .selectPaymentMethod('card'),
                                            activeColor:
                                                AppColors.buttonBackgroundColor,
                                          ),
                                          Text(
                                            'Card',
                                            style: getNormalTextStyle(
                                              fontsize: 16,
                                              fontweight: FontWeight.w400,
                                            ).copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      /// Contact Details Section
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Details',
                              style: getNormalTextStyle(
                                fontsize: 20,
                                fontweight: FontWeight.w500,
                              ).copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              controller: controller.phoneNumber,
                              maxLines: 1,
                              hint: '01xxxxxxxx',
                              label: 'Phone number',
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              controller: controller.name,
                              maxLines: 1,
                              hint: 'Your name',
                              label: 'Name (Optional)',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      /// Order Summary Section
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Summary',
                              style: getNormalTextStyle(
                                fontsize: 20,
                                fontweight: FontWeight.w500,
                              ).copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                SummaryRow('Subtotal', '\$60.00'),
                                const SizedBox(height: 14),
                                SummaryRow('Delivery', '\$10'),
                                const SizedBox(height: 14),
                                SummaryRow('Service fee', '\$20'),
                                const Divider(height: 20),
                                SummaryRow(
                                  'Total',
                                  '\$90',
                                  isBold: true,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 53),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: getNormalTextStyle(
                              fontsize: 16,
                              fontweight: FontWeight.w500,
                            ).copyWith(color: Colors.black54),
                          ),
                          Text(
                            '\$90',
                            style: getHeadingTextStyle(
                              fontsize: 24,
                              fontweight: FontWeight.w700,
                            ).copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF294B25),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Place Order',
                            style: getNormalTextStyle(
                              fontsize: 16,
                              fontweight: FontWeight.w400,
                            ).copyWith(color: Colors.white),
                          ),
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
