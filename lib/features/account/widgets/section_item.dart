import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  final String iconAsset; // Asset image path
  final String title;
  final dynamic subtitle; // Can be String or Widget
  final Widget? trailing;
  final VoidCallback? onTap;

  const SectionItem({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(iconAsset, width: 24, height: 24, color: Colors.black),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getHeadingTextStyle(
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (subtitle is String)
                    Text(
                      subtitle,
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w400,
                      ).copyWith(color: Colors.grey),
                    )
                  else if (subtitle is Widget)
                    subtitle
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
            trailing ?? const Icon(Icons.arrow_forward_ios, size: 24),
          ],
        ),
      ),
    );
  }
}
