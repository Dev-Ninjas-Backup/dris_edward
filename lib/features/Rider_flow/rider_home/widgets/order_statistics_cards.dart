import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/controller/rider_home_controller.dart';

class OrderStatisticsCards extends StatelessWidget {
  final RiderHomeController controller;

  const OrderStatisticsCards({super.key, required this.controller});

  Widget _buildCard(String value, String label) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
                alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Color(0xFF4C5968),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: _buildCard(
              controller.orderStatistics.value.statistics[0].value,
              controller.orderStatistics.value.statistics[0].label,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildCard(
              controller.orderStatistics.value.statistics[1].value,
              controller.orderStatistics.value.statistics[1].label,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildCard(
              controller.orderStatistics.value.statistics[2].value,
              controller.orderStatistics.value.statistics[2].label,
            ),
          ),
        ],
      ),
    );
  }
}
