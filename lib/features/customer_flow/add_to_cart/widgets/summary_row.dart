import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final double fontSize;

  const SummaryRow(
    this.label,
    this.value, {
    super.key,
    this.isBold = false,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getNormalTextStyle(
            fontsize: fontSize,
            fontweight: isBold ? FontWeight.w700 : FontWeight.w400,
          ).copyWith(color: Colors.black),
        ),
        Text(
          value,
          style: getNormalTextStyle(
            fontsize: fontSize,
            fontweight: isBold ? FontWeight.w700 : FontWeight.w400,
          ).copyWith(color: isBold ? Colors.black : Colors.black),
        ),
      ],
    );
  }
}
