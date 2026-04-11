import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/features/Rider_flow/request_screen/controller/request_controller.dart';
import 'package:dris_edward/features/Rider_flow/request_screen/model/request_model.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/screen/order_screen.dart';

class OrderRequestsList extends StatelessWidget {
  final RequestController controller;

  const OrderRequestsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              controller.errorMessage.value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
        );
      }

      if (controller.orderRequests.value.isEmpty) {
        return const Center(child: Text('No order requests available'));
      }

      // Display list of orders
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.orderRequests.value.length,
        itemBuilder: (context, index) {
          final order = controller.orderRequests.value[index];
          return OrderRequestCard(order: order, controller: controller);
        },
      );
    });
  }
}

class OrderRequestCard extends StatelessWidget {
  final OrderRequest order;
  final RequestController controller;

  const OrderRequestCard({
    super.key,
    required this.order,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to OrderScreen when card is tapped
        Get.to(() => const OrderScreen());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(order.customerPickupImage),
                      ),
                      Expanded(
                        child: CustomPaint(painter: DashedLinePainter()),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          order.customerDeliveryImage,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.restaurantName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    order.itemCount,
                                    style: const TextStyle(
                                      color: Color(0XFF363A33),
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    order.pickupAddress,
                                    style: const TextStyle(
                                      color: Color(0XFF363A33),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  order.timeAgo,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE0E0E0),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    order.price,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Delivered to',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          order.deliveryAddress,
                          style: const TextStyle(
                            color: Color(0XFF363A33),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pickup form',
                        style: TextStyle(
                          color: Color(0XFF979797),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        order.distance,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF979797),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.rejectOrder(order.id ?? '');
                        },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    side: const BorderSide(color: Color(0xFF2E5A27)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    controller.isLoading.value ? 'Loading...' : 'Ignore',
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.acceptOrder(order.id ?? '');
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E5A27),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    controller.isLoading.value ? 'Loading...' : 'Accept',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 4, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
