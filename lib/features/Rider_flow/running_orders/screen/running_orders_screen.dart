import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/running_orders/controller/running_order_controller.dart';
import 'package:dris_edward/features/Rider_flow/running_orders/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RunningOrdersScreen extends StatelessWidget {
  RunningOrdersScreen({super.key})
    : runningOrderController = Get.put(RunningOrderController());

  final RunningOrderController runningOrderController;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        title: Text(
                          'Running Orders',
                          style: getHeadingTextStyle(
                            fontsize: 20,
                          ).copyWith(color: Colors.black),
                        ),
                        centerTitle: true,
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category Filter Chips
                            Obx(
                              () => SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    runningOrderController.categories.length,
                                    (index) {
                                      final isSelected =
                                          runningOrderController
                                              .selectedCategoryIndex
                                              .value ==
                                          index;

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: GestureDetector(
                                          onTap: () => runningOrderController
                                              .selectCategory(index),
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              right: 10,
                                              left: 12,
                                              bottom: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? AppColors
                                                        .buttonBackgroundColor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  runningOrderController
                                                      .categories[index]['name'],
                                                  style:
                                                      getNormalTextStyle(
                                                        fontsize: 16,
                                                        fontweight:
                                                            FontWeight.w400,
                                                      ).copyWith(
                                                        color: isSelected
                                                            ? Colors.white
                                                            : Colors.black87,
                                                      ),
                                                ),
                                                const SizedBox(width: 8),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : const Color(
                                                            0xFFF37272,
                                                          ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${runningOrderController.categories[index]['count']}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: isSelected
                                                            ? AppColors
                                                                  .buttonBackgroundColor
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Loading State
                            Obx(
                              () => runningOrderController.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Color(0xFF53B453),
                                            ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),

                            // Error Message
                            Obx(
                              () =>
                                  runningOrderController
                                      .errorMessage
                                      .value
                                      .isNotEmpty
                                  ? Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        runningOrderController
                                            .errorMessage
                                            .value,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),

                            const SizedBox(height: 20),

                            // Orders List
                            Obx(() {
                              if (runningOrderController
                                  .filteredOrders
                                  .isEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'No orders found',
                                      style: getNormalTextStyle(
                                        fontsize: 16,
                                        fontweight: FontWeight.w400,
                                      ).copyWith(color: Colors.black54),
                                    ),
                                  ),
                                );
                              }

                              return Column(
                                children: List.generate(
                                  runningOrderController.filteredOrders.length,
                                  (index) {
                                    final order = runningOrderController
                                        .filteredOrders[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (index == 0 ||
                                            _getDayLabel(
                                                  runningOrderController
                                                      .filteredOrders[index - 1]
                                                      .orderDate,
                                                ) !=
                                                _getDayLabel(order.orderDate))
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 12.0,
                                            ),
                                            child: Text(
                                              _getDayLabel(order.orderDate),
                                              style: getNormalTextStyle(
                                                fontsize: 16,
                                                fontweight: FontWeight.w400,
                                              ).copyWith(color: Colors.black),
                                            ),
                                          ),
                                        OrderSummaryCard(
                                          orderId: order.orderId,
                                          status: order.status,
                                          items: order.items,
                                          isPickedUp: order.isPickedUp,
                                        ),
                                        if (index <
                                            runningOrderController
                                                    .filteredOrders
                                                    .length -
                                                1)
                                          const SizedBox(height: 15),
                                      ],
                                    );
                                  },
                                ),
                              );
                            }),
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

  /// Get day label for order date
  String _getDayLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 1));
    final orderDate = DateTime(date.year, date.month, date.day);

    if (orderDate == today) {
      return 'Today';
    } else if (orderDate == yesterday) {
      return 'Yesterday';
    } else {
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    }
  }
}
