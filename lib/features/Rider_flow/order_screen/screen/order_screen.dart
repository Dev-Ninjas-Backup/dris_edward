import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/widgets/payment_method_card.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/widgets/restaurant_detail_card.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        title: Text(
                          'Order Details',
                          style: getHeadingTextStyle(
                            fontsize: 20,
                          ).copyWith(color: Colors.black),
                        ),
                        centerTitle: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            RestaurantDetailCard(
                              title: 'Restaurant detail',
                              role: 'Hungry Puppets',
                              itemCount: '1 Item',
                              address: 'House: 00, Road 00',
                              imageUrl: Imagepath.customerImageOne,
                              onPhonePressed: () {
                                // TODO: Add phone call logic
                              },
                              onChatPressed: () {
                                // TODO: Add chat logic
                              },
                            ),
                            const SizedBox(height: 16),
                            RestaurantDetailCard(
                              title: 'Customer Details',
                              role: 'Delivered to',
                              itemCount: '2 Items',
                              address: '58.447, -101.69, Canada',
                              imageUrl: Imagepath.customerImageTwo,
                              onPhonePressed: () {
                                // TODO: Add phone call logic
                              },
                              onChatPressed: () {
                                // TODO: Add chat logic
                              },
                            ),
                            const SizedBox(height: 20),
                            PaymentMethodCard(
                              label: 'Payment Method',
                              methodName: 'Cash',
                              iconPath: Iconpath.cashIcon,
                              onTap: () {
                                // TODO: Add payment method selection logic
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
