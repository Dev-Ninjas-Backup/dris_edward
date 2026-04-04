import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CustomFlexibleButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? fontSize;
  final VoidCallback onTap;
  final double? buttonWidth; 
  final Widget? leading;

  const CustomFlexibleButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.leading,
    this.fontSize,
    this.buttonWidth, 
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 10)],
            Text(
              buttonText,
              style: getButtonTextStyle(
                fontsize: fontSize ?? 16.0,
                fontweight: FontWeight.w400,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
