// ignore_for_file: deprecated_member_use

import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/core/common/widgets/custom_primary_icon_button.dart';
import 'package:dris_edward/home/controller/home_controller.dart';
import 'package:dris_edward/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectResturantScreen extends StatelessWidget {
  const SelectResturantScreen({super.key});
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Find a Store',
                      style: getHeadingTextStyle(
                        fontsize: 24,
                        fontweight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.black),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Search...',
                            style: getNormalTextStyle(
                              fontsize: 14,
                              fontweight: FontWeight.w400,
                            ).copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Iconpath.locationIcon2,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Use my current location',
                        style: getNormalTextStyle(
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                        ).copyWith(color: AppColors.buttonBackgroundColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Nearby Stores',
                    style: getNormalTextStyle(
                      fontsize: 24,
                      fontweight: FontWeight.w500,
                    ).copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
