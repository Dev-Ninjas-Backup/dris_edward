// ignore_for_file: deprecated_member_use

import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_icon_button.dart';
import 'package:dris_edward/home/controller/home_controller.dart';
import 'package:dris_edward/home/widgets/product_card.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) : homeController = Get.put(HomeController());

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Location Row
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(17),
                        child: Image.asset(
                          Iconpath.locationIcon,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Location',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Mirpur Dhaka Bangladesh',
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        Iconpath.notificationIcon,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.black),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Search...',
                            style: getNormalTextStyle(
                              fontsize: 14,
                              fontweight: FontWeight.w400,
                            ).copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Category Chips
                  Obx(
                    () => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          homeController.categories.length,
                          (index) {
                            final isSelected =
                                homeController.selectedCategoryIndex.value ==
                                index;

                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () =>
                                    homeController.selectCategory(index),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.buttonBackgroundColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    homeController.categories[index],
                                    style:
                                        getNormalTextStyle(
                                          fontsize: 16,
                                          fontweight: FontWeight.w400,
                                        ).copyWith(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// Ongoing Offers
                  Text(
                    'Ongoing Offers',
                    style: getNormalTextStyle(
                      fontsize: 24,
                      fontweight: FontWeight.w500,
                    ).copyWith(color: Colors.black),
                  ),

                  const SizedBox(height: 12),

                  /// Offer Banner - PageView slider
                  SizedBox(
                    height: 164,
                    child: PageView.builder(
                      itemCount: homeController.bannerImages.length,
                      onPageChanged: (index) {
                        homeController.currentBannerIndex.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(
                                homeController.bannerImages[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Dots Indicator
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        homeController.bannerImages.length,
                        (index) => _buildDot(
                          isActive:
                              homeController.currentBannerIndex.value == index,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// Product Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Potato Bowls',
                        style: getNormalTextStyle(
                          fontsize: 24,
                          fontweight: FontWeight.w500,
                        ).copyWith(color: Colors.black),
                      ),
                      Text(
                        '4 items',
                        style: getNormalTextStyle(
                          fontsize: 18,
                          fontweight: FontWeight.w400,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Product cards - responsive 2-column wrap
                  LayoutBuilder(
                    builder: (context, constraints) {
                      const spacing = 12.0;
                      final itemWidth = (constraints.maxWidth - spacing) / 2;

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: [
                          for (final product in homeController.products)
                            SizedBox(
                              width: itemWidth,
                              child: ProductCard(
                                title: product['title']!,
                                description: product['description']!,
                                price: product['price']!,
                                rating: product['rating']!,
                                reviewText: product['reviews']!,
                                imagePath: product['image']!,
                              ),
                            ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  /// Button with icon
                  CustomPrimaryIconButton(
                    buttonText: 'See more Store',
                    buttonColor: AppColors.buttonBackgroundColor,
                    leading: Image.asset(
                      Iconpath.bagIcon,
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.toNamed(AppRoute.selectResturantScreen);
                    },
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

/// Dot Indicator
Widget _buildDot({required bool isActive}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.symmetric(horizontal: 3),
    width: isActive ? 30 : 17,
    height: 5,
    decoration: BoxDecoration(
      color: isActive
          ? AppColors.buttonBackgroundColor
          : AppColors.buttonBackgroundColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
