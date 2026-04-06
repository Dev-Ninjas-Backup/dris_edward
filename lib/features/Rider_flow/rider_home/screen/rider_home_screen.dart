import 'package:dris_edward/features/Rider_flow/rider_home/widgets/order_request_card.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/widgets/order_statistics_cards.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/widgets/user_profile_header.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/controller/rider_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderHomeScreen extends StatelessWidget {
  RiderHomeScreen({super.key});

  final controller = Get.put(RiderHomeController());

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
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        UserProfileHeader(controller: controller),
                        const SizedBox(height: 50),
                        OrderStatisticsCards(controller: controller),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recent Orders',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Obx(
                                  () => Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              controller
                                                  .userProfile
                                                  .value
                                                  .isOnline
                                              ? const Color(0xFF22C55E)
                                              : Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        controller.userProfile.value.isOnline
                                            ? 'Online'
                                            : 'Offline',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              controller
                                                  .userProfile
                                                  .value
                                                  .isOnline
                                              ? const Color(0xFF22C55E)
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () => controller.viewAllOrders(),
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                  color: Color(0xFF53B453),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        OrderRequestCard(controller: controller),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
