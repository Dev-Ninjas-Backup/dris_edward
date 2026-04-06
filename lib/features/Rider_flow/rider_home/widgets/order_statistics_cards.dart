import 'package:flutter/material.dart';

class OrderStatisticsCards extends StatelessWidget {
  const OrderStatisticsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: _StatisticCard(value: '3', label: 'Today’s\nOrder'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatisticCard(value: '14', label: 'This Week\nOrder'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatisticCard(value: '36', label: 'Total\nOrder'),
          ),
        ],
      ),
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatisticCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
}
