// ignore_for_file: deprecated_member_use

import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/rewards/controller/rewards_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key, required this.controller});

  final RewardsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF306730),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Rewards',
                        style: getHeadingTextStyle(
                          fontsize: 24,
                          fontweight: FontWeight.w700,
                        ).copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Current Balance',
                        style: getNormalTextStyle(
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                        ).copyWith(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      Obx(
                        () => Text(
                          controller.currentBalance.value.toString(),
                          style: getHeadingTextStyle(
                            fontsize: 32,
                            fontweight: FontWeight.w700,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        'Points',
                        style: getNormalTextStyle(
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                        ).copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                  Image.asset(Iconpath.coins, width: 60, height: 60),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress to next reward',
                    style: getNormalTextStyle(
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                    ).copyWith(color: Colors.white),
                  ),
                  Obx(
                    () => Text(
                      '${controller.pointsToNextReward.value - controller.currentBalance.value} Pts To Go',
                      style: getNormalTextStyle(
                        fontsize: 16,
                        fontweight: FontWeight.w400,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Obx(
                        () => LinearProgressIndicator(
                          value: controller.progressPercentage.value,
                          minHeight: 8,
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.buttonBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -40,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(Iconpath.coin, width: 80, height: 80),
          ),
        ),
      ],
    );
  }
}
