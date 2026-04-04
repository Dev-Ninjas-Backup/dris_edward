import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/features/revirew/controller/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingProgressCard extends StatelessWidget {
  const RatingProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReviewController>();

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingProgressRow(
              label: 'Excellent',
              count: controller.excellentCount.value,
              total: controller.totalReviews.value,
              color: AppColors.progressExcellent,
            ),
            const SizedBox(height: 10),
            RatingProgressRow(
              label: 'Good',
              count: controller.goodCount.value,
              total: controller.totalReviews.value,
              color: AppColors.progressGood,
            ),
            const SizedBox(height: 10),
            RatingProgressRow(
              label: 'Average',
              count: controller.averageCount.value,
              total: controller.totalReviews.value,
              color: AppColors.progressAverage,
            ),
          ],
        ),
      ),
    );
  }
}

class RatingProgressRow extends StatelessWidget {
  final String label;
  final int count;
  final int total;
  final Color color;

  const RatingProgressRow({
    super.key,
    required this.label,
    required this.count,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double value = total > 0 ? count / total : 0.0;

    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 8,
              backgroundColor: Color(0xFFE6E6E6),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }
}
