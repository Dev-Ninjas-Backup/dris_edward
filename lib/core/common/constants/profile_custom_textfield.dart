import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ProfileCustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const ProfileCustomTextfield({
    super.key,
    this.controller,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        controller: controller,
        style: getNormalTextStyle().copyWith(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: getNormalTextStyle().copyWith(
            color: const Color(0xFFB3B3B3),
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
