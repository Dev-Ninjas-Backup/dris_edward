import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/controller/rider_home_controller.dart';

class UserProfileHeader extends StatelessWidget {
  final RiderHomeController controller;

  const UserProfileHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                controller.userProfile.value.profileImage,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.userProfile.value.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    controller.userProfile.value.joinDate,
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ],
              ),
            ),

            // Toggle Button
            GestureDetector(
              onTap: () => controller.toggleOnlineStatus(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 90,
                height: 32,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: controller.userProfile.value.isOnline
                      ? AppColors.activeStatus
                      : Colors.white,
                  border: Border.all(
                    color: controller.userProfile.value.isOnline
                        ? AppColors.activeStatus
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        controller.userProfile.value.isOnline
                            ? 'Online'
                            : 'Offline',
                        style: TextStyle(
                          color: controller.userProfile.value.isOnline
                              ? Colors.white
                              : Colors.black87,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: controller.userProfile.value.isOnline
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: 24,
                        height: 26,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
