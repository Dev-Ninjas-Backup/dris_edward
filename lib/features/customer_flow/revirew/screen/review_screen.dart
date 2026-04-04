import 'package:dris_edward/features/customer_flow/revirew/widgets/rating_progress_card.dart';
import 'package:dris_edward/features/customer_flow/revirew/widgets/review_card.dart';
import 'package:dris_edward/features/customer_flow/revirew/controller/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/core/common/constants/app_colors.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());

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
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Center(
                    child: Text(
                      controller.averageRating.value.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonBackgroundColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Icon(
                              Icons.star,
                              size: 24,
                              color: i < controller.averageRating.value.toInt()
                                  ? AppColors.buttonBackgroundColor
                                  : AppColors.falseStarColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => Text(
                    'Based on ${controller.totalReviews.value} reviews',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const RatingProgressCard(),
                const SizedBox(height: 28),
                Obx(
                  () => Column(
                    children: List.generate(
                      controller.reviews.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: ReviewCard(
                          name: controller.reviews[index].name,
                          rating: controller.reviews[index].rating,
                          reviewText: controller.reviews[index].reviewText,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
