import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/order_history/controller/order_history_controller.dart';
import 'package:dris_edward/features/order_history/widgets/order_item_widget.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderHistoryController());
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
                    'Order History',
                    style: getHeadingTextStyle(
                      fontsize: 24,
                      fontweight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: true,
                ),

                /// ORDER LIST
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) {
                      final order = controller.orders[index];
                      return OrderItemWidget(
                        restaurantName: order.restaurantName,
                        restaurantImage: order.restaurantImage,
                        status: order.status,
                        date: order.date,
                        time: order.time,
                        totalAmount: order.totalAmount,
                        statusColor: controller.getStatusColor(order.status),
                        onTap: () => Get.toNamed(AppRoute.orderDetailsScreen),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
