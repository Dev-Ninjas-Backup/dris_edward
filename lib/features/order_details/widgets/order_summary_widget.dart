import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatelessWidget {
  final String subtotal;
  final String deliveryFee;
  final String serviceFee;
  final String total;

  const OrderSummaryWidget({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.serviceFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE3E3E3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: getHeadingTextStyle(
              fontsize: 20,
              fontweight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),

          /// SUBTOTAL
          _summaryRow('Subtotal', subtotal),
          const SizedBox(height: 12),

          /// DELIVERY FEE
          _summaryRow('Delivery', deliveryFee),
          const SizedBox(height: 12),

          /// SERVICE FEE
          _summaryRow('Service fee', serviceFee),
          const SizedBox(height: 6),

          /// DIVIDER
          Container(height: 2, color: Colors.grey.shade200),
          const SizedBox(height: 10),

          /// TOTAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: getHeadingTextStyle(
                  fontsize: 16,
                  fontweight: FontWeight.w700,
                ),
              ),
              Text(
                total,
                style: getHeadingTextStyle(
                  fontsize: 16,
                  fontweight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getNormalTextStyle(
            fontsize: 16,
            fontweight: FontWeight.w400,
          ).copyWith(color: const Color(0xFF666666)),
        ),
        Text(
          value,
          style: getNormalTextStyle(
            fontsize: 14,
            fontweight: FontWeight.w600,
          ).copyWith(color: const Color(0xFF333333)),
        ),
      ],
    );
  }
}
