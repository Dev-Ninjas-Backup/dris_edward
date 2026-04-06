import 'package:dris_edward/features/Rider_flow/rider_home/widgets/order_statistics_cards.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/widgets/user_profile_header.dart';
import 'package:flutter/material.dart';

class RiderHomeScreen extends StatelessWidget {
  const RiderHomeScreen({super.key});

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 70), UserProfileHeader(),
                const SizedBox(height: 50),
                const OrderStatisticsCards(),
                // Add more widgets here as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
