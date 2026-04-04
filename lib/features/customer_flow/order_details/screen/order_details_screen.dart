import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/customer_flow/order_details/controller/order_detail_controller.dart';
import 'package:dris_edward/features/customer_flow/order_details/widgets/order_details_delivery_card.dart';
import 'package:dris_edward/features/customer_flow/order_details/widgets/order_details_restaurant_card.dart';
import 'package:dris_edward/features/customer_flow/order_details/widgets/order_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderDetailController());
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER WITH BACK BUTTON AND TITLE
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  title: Text(
                    'Order Details',
                    style: getHeadingTextStyle(
                      fontsize: 24,
                      fontweight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: true,
                ),
                const SizedBox(height: 16),

                /// ORDER CONTENT
                Obx(() {
                  final order = controller.orderDetail.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// RESTAURANT CARD
                        OrderDetailsRestaurantCard(
                          restaurantName: order.restaurantName,
                          restaurantImage: order.restaurantImage,
                          date: order.date,
                          time: order.time,
                          price: order.price,
                          orderId: order.orderId,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            Imagepath.orderDetailsImage,
                            width: 206,
                            height: 116,
                          ),
                        ),
                        SizedBox(height: 30),

                        /// DELIVERY CARD
                        OrderDetailsDeliveryCard(
                          driverName: order.driverName,
                          driverStatus: order.driverStatus,
                          driverImage: order.driverImage,
                        ),
                        const SizedBox(height: 16),

                        /// ORDER SUMMARY
                        OrderSummaryWidget(
                          subtotal: order.subtotal,
                          deliveryFee: order.deliveryFee,
                          serviceFee: order.serviceFee,
                          total: order.total,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
