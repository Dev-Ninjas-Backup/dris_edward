import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/notification/widgets/notification_toggle.dart';
import 'package:dris_edward/features/Rider_flow/request_screen/model/request_model.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF53B453), Colors.white, Colors.white],
          stops: [0.1, 0.4, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Text(
                  'Notifications',
                  style: getHeadingTextStyle(
                    fontsize: 20,
                  ).copyWith(color: Colors.black),
                ),
                centerTitle: true,
              ),
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF2E5A27).withOpacity(0.5),
                    ),
                  ),
                  child: const NotificationToggle(),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
