import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class OrderDetailsDeliveryCard extends StatelessWidget {
  final String driverName;
  final String driverImage;
  final String driverStatus;

  const OrderDetailsDeliveryCard({
    super.key,
    required this.driverName,
    required this.driverImage,
    required this.driverStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// DELIVERY ILLUSTRATION

        /// DRIVER INFO
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFE3E3E3), width: 2),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(driverImage),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverName,
                      style: getNormalTextStyle(
                        fontsize: 20,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      driverStatus,
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w400,
                      ).copyWith(color: const Color(0xFF666666)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
