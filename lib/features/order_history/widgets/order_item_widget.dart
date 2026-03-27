import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String status;
  final String date;
  final String time;
  final String totalAmount;
  final Color statusColor;
  final VoidCallback? onTap;

  const OrderItemWidget({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.status,
    required this.date,
    required this.time,
    required this.totalAmount,
    required this.statusColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            /// RESTAURANT IMAGE
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
            const SizedBox(width: 15),

            /// ORDER DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// RESTAURANT NAME AND STATUS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantName,
                        style: getNormalTextStyle(
                          fontsize: 20,
                          fontweight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: getNormalTextStyle(
                            fontsize: 12,
                            fontweight: FontWeight.w600,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  /// DATE AND TIME
                  Text(
                    '$date • $time',
                    style: getNormalTextStyle(
                      fontsize: 13,
                      fontweight: FontWeight.w400,
                    ).copyWith(color: const Color(0xFF666666)),
                  ),
                  const SizedBox(height: 6),

                  /// TOTAL AMOUNT
                  Text(
                    totalAmount,
                    style: getNormalTextStyle(
                      fontsize: 14,
                      fontweight: FontWeight.w600,
                    ).copyWith(color: const Color(0xFF333333)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
