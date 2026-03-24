import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const CustomTextfield({super.key, this.controller, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: getNormalTextStyle().copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: getNormalTextStyle().copyWith(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
