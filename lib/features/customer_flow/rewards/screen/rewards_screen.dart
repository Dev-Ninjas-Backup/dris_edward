// ignore_for_file: deprecated_member_use
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/customer_flow/rewards/controller/rewards_controller.dart';
import 'package:dris_edward/features/customer_flow/rewards/widgets/reward_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RewardsController());

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
                  const SizedBox(height: 31),

                  /// My Rewards Card
                  RewardCard(controller: controller),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Iconpath.coins, width: 40, height: 40),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Earn Points',
                                style: getNormalTextStyle(
                                  fontsize: 20,
                                  fontweight: FontWeight.w600,
                                ).copyWith(color: Colors.black),
                              ),
                              Text(
                                'Earn 1 point per €1 spent',
                                style: getNormalTextStyle(
                                  fontsize: 14,
                                  fontweight: FontWeight.w400,
                                ).copyWith(color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Points expire!',
                                style: getNormalTextStyle(
                                  fontsize: 12,
                                  fontweight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  /// Redeem Points Section
                  Text(
                    'Redeem Points',
                    style: getNormalTextStyle(
                      fontsize: 20,
                      fontweight: FontWeight.w600,
                    ).copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 12),

                  /// Free Coffee Reward
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Imagepath.coffeeImage,
                            width: 87,
                            height: 87,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Free Coffee',
                                style: getNormalTextStyle(
                                  fontsize: 20,
                                  fontweight: FontWeight.w600,
                                ).copyWith(color: Colors.black),
                              ),
                              //const SizedBox(height: 4),
                              Text(
                                'Any regular sue coffee',
                                style: getNormalTextStyle(
                                  fontsize: 14,
                                  fontweight: FontWeight.w400,
                                ).copyWith(color: Colors.black54),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '50 Points',
                                  style: getNormalTextStyle(
                                    fontsize: 12,
                                    fontweight: FontWeight.w500,
                                  ).copyWith(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF294B25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Redeem',
                              style: getNormalTextStyle(
                                fontsize: 12,
                                fontweight: FontWeight.w600,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// Free Cookie Reward
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            Imagepath.coffeeImage,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Free Cookie',
                                style: getNormalTextStyle(
                                  fontsize: 16,
                                  fontweight: FontWeight.w600,
                                ).copyWith(color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Chocolate chip or oatmeal',
                                style: getNormalTextStyle(
                                  fontsize: 12,
                                  fontweight: FontWeight.w400,
                                ).copyWith(color: Colors.black54),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '75 Points',
                                  style: getNormalTextStyle(
                                    fontsize: 12,
                                    fontweight: FontWeight.w500,
                                  ).copyWith(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF294B25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Redeem',
                              style: getNormalTextStyle(
                                fontsize: 12,
                                fontweight: FontWeight.w600,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
