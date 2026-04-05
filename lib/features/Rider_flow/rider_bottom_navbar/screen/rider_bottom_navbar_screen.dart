import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/Request_screen/screen/request_screen.dart';
import 'package:dris_edward/features/Rider_flow/notification/screen/notification_screen.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/screen/order_screen.dart';
import 'package:dris_edward/features/Rider_flow/rider_account/screen/rider_account_screen.dart';
import 'package:dris_edward/features/Rider_flow/rider_bottom_navbar/controller/rider_bottom_navbar_controller.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/screen/rider_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderBottomNavbar extends StatelessWidget {
  const RiderBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final RiderBottomNavbarController controller = Get.put(
      RiderBottomNavbarController(),
    );

    final List<Widget> pages = [
      RiderHomeScreen(),
      RequestScreen(),
      OrderScreen(),
      NotificationScreen(),
      RiderAccountScreen(),
    ];

    final List<String> icons = [
      Iconpath.homeIcon,
      Iconpath.favoriteIcon,
      Iconpath.rewardsIcon,
      Iconpath.cartIcon,
      Iconpath.accountIcon,
    ];

    final List<String> labels = [
      "Home",
      "Request",
      "Order",
      "Notification",
      "Account",
    ];

    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 46, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              bool isSelected = controller.currentIndex.value == index;
              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      icons[index],
                      width: 24,
                      height: 24,
                      color: isSelected
                          ? AppColors.buttonBackgroundColor
                          : Colors.grey,
                    ),
                    SizedBox(height: 2),
                    Text(
                      labels[index],
                      style: getNormalTextStyle().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? AppColors.buttonBackgroundColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
