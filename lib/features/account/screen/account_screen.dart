// ignore_for_file: deprecated_member_use
import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/account/controller/account_controller.dart';
import 'package:dris_edward/features/account/widgets/section_item.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountController());

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  /// PROFILE HEADER
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          Imagepath.profileImage,
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'John Doe',
                          style: getHeadingTextStyle(
                            fontsize: 24,
                            fontweight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'johndoe@example.com',
                          style: getNormalTextStyle(
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                          ).copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// NOTIFICATIONS SECTION
                  Obx(
                    () => SectionItem(
                      iconAsset: Iconpath.notificationIcon,
                      title: 'Notifications',
                      subtitle: Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: controller.notificationsEnabled.value,
                              onChanged: (value) {
                                controller.toggleNotifications(value);
                              },
                              activeColor: AppColors.buttonBackgroundColor,
                            ),
                          ),
                          Text(
                            'Enable Push Notifications',
                            style: getNormalTextStyle(
                              fontsize: 14,
                              fontweight: FontWeight.w400,
                            ).copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: SizedBox.shrink(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// PERSONAL INFORMATION SECTION
                  SectionItem(
                    iconAsset: Iconpath.accountIcon,
                    title: 'Personal Information',
                    subtitle: 'View your Profile Info',
                    onTap: () {
                      Get.toNamed(AppRoute.profileInfoScreen);
                    },
                  ),

                  const SizedBox(height: 16),

                  /// ORDER HISTORY SECTION
                  SectionItem(
                    iconAsset: Iconpath.orderIcon,
                    title: 'Order History',
                    subtitle: 'View your past orders',
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  /// TERMS & CONDITIONS SECTION
                  SectionItem(
                    iconAsset: Iconpath.termsIcon,
                    title: 'Terms & Conditions',
                    subtitle: 'Our terms of Service',
                    onTap: () {},
                  ),

                  const SizedBox(height: 40),

                  /// LOGOUT BUTTON
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDECEC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Iconpath.logoutIcon,
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: getNormalTextStyle(
                                  fontsize: 16,
                                  fontweight: FontWeight.w500,
                                ).copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
