import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/features/customer_flow/order_history/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  // List of orders
  RxList<Order> orders = <Order>[
    Order(
      restaurantName: "McDonald's",
      restaurantImage: 'assets/images/mcdonalds.png',
      status: 'DELIVERED',
      date: 'Mar 12, 2026',
      time: '2:30 PM',
      totalAmount: '\$23.49',
    ),
    Order(
      restaurantName: 'BBQ Chicken',
      restaurantImage: 'assets/images/bbq_chicken.png',
      status: 'ON THE WAY',
      date: 'Mar 12, 2026',
      time: '2:30 PM',
      totalAmount: '\$23.49',
    ),
    Order(
      restaurantName: "McDonald's",
      restaurantImage: 'assets/images/mcdonalds.png',
      status: 'DELIVERED',
      date: 'Mar 12, 2026',
      time: '2:30 PM',
      totalAmount: '\$23.49',
    ),
    Order(
      restaurantName: 'Burger',
      restaurantImage: 'assets/images/burger.png',
      status: 'CANCELLED',
      date: 'Mar 12, 2026',
      time: '2:30 PM',
      totalAmount: '\$23.49',
    ),
  ].obs;

  /// Get badge color based on status
  Color getStatusColor(String status) {
    switch (status) {
      case 'DELIVERED':
        return AppColors.buttonBackgroundColor;
      case 'ON THE WAY':
        return const Color(0xFFFFA500);
      case 'CANCELLED':
        return const Color(0xFFE74C3C);
      default:
        return Colors.grey;
    }
  }
}
