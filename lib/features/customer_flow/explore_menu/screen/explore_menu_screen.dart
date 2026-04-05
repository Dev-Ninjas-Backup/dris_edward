import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/customer_flow/home/controller/home_controller.dart';
import 'package:dris_edward/features/customer_flow/home/widgets/product_card.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreMenuScreen extends StatelessWidget {
  ExploreMenuScreen({super.key}) : homeController = Get.put(HomeController());

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'Favorites',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF054805),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.search, color: Colors.white, size: 24),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// Category Chips
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(homeController.categories.length, (
                      index,
                    ) {
                      final isSelected =
                          homeController.selectedCategoryIndex.value == index;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () => homeController.selectCategory(index),
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
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Product cards
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const spacing = 12.0;
                    final itemWidth = (constraints.maxWidth - spacing) / 2;

                    return SingleChildScrollView(
                      child: Wrap(
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
                                onTap: () {
                                  Get.toNamed(
                                    AppRoute.productDetailsScreen,
                                    arguments: {
                                      'title': product['title'],
                                      'description': product['description'],
                                      'price': product['price'],
                                      'rating': product['rating'],
                                      'reviewCount': product['reviews'],
                                      'imagePath': product['image'],
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
