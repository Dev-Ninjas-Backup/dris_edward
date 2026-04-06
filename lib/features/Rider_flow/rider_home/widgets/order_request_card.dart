import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/controller/rider_home_controller.dart';

class OrderRequestCard extends StatelessWidget {
  final RiderHomeController controller;

  const OrderRequestCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
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
                        backgroundImage: AssetImage(
                          controller.orderRequest.value.restaurantImage,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: DottedBorder(
                            color: Colors.grey.shade200,
                            strokeWidth: 1,
                            dashPattern: const [4, 3],
                            child: const SizedBox(width: 1),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          controller.orderRequest.value.driverImage,
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
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.orderRequest.value.restaurantName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  controller.orderRequest.value.itemCount,
                                  style: const TextStyle(
                                    color: Color(0XFF363A33),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              controller.orderRequest.value.timeAgo,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        // Vertical Dotted Line implementation
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 4,
                            bottom: 4,
                          ),
                          child: SizedBox(
                            height: 40, // Adjust height to control the gap
                            child: CustomPaint(painter: DashedLinePainter()),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Delivered to',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    controller
                                        .orderRequest
                                        .value
                                        .deliveryLocation,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0XFF363A33),
                                    ),
                                  ),
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0XFFFF7A00),
                                      size: 12,
                                    ),
                                    Text(
                                      ' View Map',
                                      style: TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 33),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.orderRequest.value.pickupLocationName,
                        style: const TextStyle(color: Color(0XFF979797)),
                      ),
                      Text(
                        controller.orderRequest.value.deliveryDistance,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF979797),
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () => controller.ignoreOrder(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    side: const BorderSide(color: Color(0xFF2E5A27)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Ignore',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => controller.acceptOrder(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E5A27),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Accept',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
      ..color = Colors.black
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
