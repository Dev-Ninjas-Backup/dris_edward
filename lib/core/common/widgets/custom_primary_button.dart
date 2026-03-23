import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? fontSize;
  final VoidCallback onTap;
  final double? buttonWidth;
  const CustomPrimaryButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.fontSize,
    this.buttonWidth,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: buttonColor == Colors.transparent
              ? Colors.white
              : Colors.transparent,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
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
