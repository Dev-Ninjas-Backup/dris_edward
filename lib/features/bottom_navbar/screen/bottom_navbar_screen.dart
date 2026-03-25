import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/account/screen/account_screen.dart';
import 'package:dris_edward/features/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:dris_edward/features/cart/screen/cart_screen.dart';
import 'package:dris_edward/features/favorite/screen/favorite_screen.dart';
import 'package:dris_edward/features/rewards/screen/rewards_screen.dart';
import 'package:dris_edward/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController controller = Get.put(NavBarController());

    final List<Widget> pages = [
      HomeScreen(),
      FavoriteScreen(),
      RewardsScreen(),
      CartScreen(),
      AccountScreen(),
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
      "Favorite",
      "Rewards",
      "Cart",
      "Account",
    ];

    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            bottom: 46.h,
            top: 12.h,
          ),
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
                      width: 24.w,
                      height: 24.h,
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
