import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final double? fontSize;
  final VoidCallback onTap;
  final double? buttonWidth;
  final List<Color>? gradientColor;
  const CustomPrimaryButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.fontSize,
    this.buttonWidth,
    this.gradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackgroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: const Size(double.infinity, 52),
        ),
        onPressed: onTap,
        child: Text(
          buttonText,

          style: getButtonTextStyle().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
