import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/product_details/controller/product_details_controller.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());

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
          child: Column(
            children: [
              /// Product image area with overlaid buttons
              Stack(
                children: [
                  Container(
                    height: 310,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                        image: AssetImage(controller.product.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// Back button
                  Positioned(
                    top: 68,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  /// Favorite button
                  Positioned(
                    top: 68,
                    right: 16,
                    child: Obx(
                      () => GestureDetector(
                        onTap: () => controller.toggleFavorite(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            controller.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 24,
                            color: AppColors.buttonBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              /// Product info and rest of content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product name and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            controller.product.title,
                            style: getNormalTextStyle(
                              fontsize: 24,
                              fontweight: FontWeight.w700,
                            ).copyWith(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '\$${controller.product.price.toStringAsFixed(2)}',
                          style: getNormalTextStyle(
                            fontsize: 24,
                            fontweight: FontWeight.w500,
                          ).copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Description
                    Text(
                      controller.product.description,
                      style: getNormalTextStyle(
                        fontsize: 16,
                        fontweight: FontWeight.w400,
                      ).copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 10),

                    /// Rating
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.getReviewScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: AppColors.buttonBackgroundColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${controller.product.rating}',
                            style: getNormalTextStyle(
                              fontsize: 20,
                              fontweight: FontWeight.w500,
                            ).copyWith(color: Colors.black),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '(${controller.product.reviewCount} review)',
                            style: getNormalTextStyle(
                              fontsize: 20,
                              fontweight: FontWeight.w400,
                            ).copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Select Size
                    Text(
                      'Select Size',
                      style: getNormalTextStyle(
                        fontsize: 20,
                        fontweight: FontWeight.w500,
                      ).copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => Row(
                        children: [
                          for (
                            int i = 0;
                            i < controller.product.availableSizes.length;
                            i++
                          ) ...[
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.selectSize(
                                  controller.product.availableSizes[i],
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        controller.selectedSize.value ==
                                            controller.product.availableSizes[i]
                                        ? AppColors.buttonBackgroundColor
                                        : Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.product.availableSizes[i],
                                      style:
                                          getNormalTextStyle(
                                            fontsize: 16,
                                            fontweight: FontWeight.w400,
                                          ).copyWith(
                                            color:
                                                controller.selectedSize.value ==
                                                    controller
                                                        .product
                                                        .availableSizes[i]
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (i <
                                controller.product.availableSizes.length - 1)
                              const SizedBox(width: 10),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    /// Ingredients
                    Text(
                      'Ingredients',
                      style: getNormalTextStyle(
                        fontsize: 20,
                        fontweight: FontWeight.w500,
                      ).copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Column(
                        children: List.generate(controller.ingredients.length, (
                          index,
                        ) {
                          final ingredient = controller.ingredients[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    ingredient.name,
                                    style: getNormalTextStyle(
                                      fontsize: 16,
                                      fontweight: FontWeight.w400,
                                    ).copyWith(color: Colors.black),
                                  ),
                                ),
                                Image.asset(
                                  Iconpath.checkIcon,
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 26),

                    /// Allergy Information
                    Text(
                      'Allergy Information',
                      style: getNormalTextStyle(
                        fontsize: 20,
                        fontweight: FontWeight.w500,
                      ).copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6EDE6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This item may contain:',
                            style: getNormalTextStyle(
                              fontsize: 14,
                              fontweight: FontWeight.w500,
                            ).copyWith(color: AppColors.buttonBackgroundColor),
                          ),
                          const SizedBox(height: 8),
                          ...List.generate(
                            controller.product.allergyInfo.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '• ${controller.product.allergyInfo[index]}',
                                style:
                                    getNormalTextStyle(
                                      fontsize: 14,
                                      fontweight: FontWeight.w500,
                                    ).copyWith(
                                      color: AppColors.buttonBackgroundColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    /// Add Extras
                    Text(
                      'Add Extras',
                      style: getNormalTextStyle(
                        fontsize: 20,
                        fontweight: FontWeight.w500,
                      ).copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Column(
                        children: List.generate(controller.extras.length, (
                          index,
                        ) {
                          final extra = controller.extras[index];

                          return GestureDetector(
                            onTap: () => controller.toggleExtra(index),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColors.buttonBackgroundColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          extra.name,
                                          style: getNormalTextStyle(
                                            fontsize: 16,
                                            fontweight: FontWeight.w400,
                                          ).copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '+\$${extra.additionalPrice.toStringAsFixed(2)}',
                                    style: getNormalTextStyle(
                                      fontsize: 14,
                                      fontweight: FontWeight.w400,
                                    ).copyWith(color: Colors.grey),
                                  ),
                                  const SizedBox(width: 12),
                                  Checkbox(
                                    value: extra.isSelected,
                                    onChanged: (value) {
                                      controller.toggleExtra(index);
                                    },
                                    activeColor:
                                        AppColors.buttonBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// Total
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(
                        //   color: AppColors.buttonBackgroundColor,
                        // ),
                        // borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: getNormalTextStyle(
                              fontsize: 16,
                              fontweight: FontWeight.w500,
                            ).copyWith(color: Colors.black),
                          ),
                          Obx(
                            () => Text(
                              '\$${controller.totalPrice.value.toStringAsFixed(2)}',
                              style: getNormalTextStyle(
                                fontsize: 16,
                                fontweight: FontWeight.w500,
                              ).copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Cancel and Add to Cart buttons
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: getNormalTextStyle(
                                    fontsize: 16,
                                    fontweight: FontWeight.w600,
                                  ).copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.addToCart(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: AppColors.buttonBackgroundColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Add to Cart',
                                  style: getNormalTextStyle(
                                    fontsize: 16,
                                    fontweight: FontWeight.w600,
                                  ).copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
