import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class OrderDetailsRestaurantCard extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String date;
  final String time;
  final String price;
  final String orderId;

  const OrderDetailsRestaurantCard({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.date,
    required this.time,
    required this.price,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// RESTAURANT INFO
          Row(
            children: [
              Container(
                width: 87,
                height: 87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(restaurantImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurantName,
                      style: getNormalTextStyle(
                        fontsize: 20,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$date • $time',
                      style: getNormalTextStyle(
                        fontsize: 12,
                        fontweight: FontWeight.w400,
                      ).copyWith(color: const Color(0xFF666666)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price,
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// ORDER ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ID',
                style: getNormalTextStyle(
                  fontsize: 16,
                  fontweight: FontWeight.w400,
                ).copyWith(color: const Color(0xFF666666)),
              ),
              Text(
                orderId,
                style: getNormalTextStyle(
                  fontsize: 16,
                  fontweight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
