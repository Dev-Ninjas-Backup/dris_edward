import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/cart/controller/cart_controller.dart';
import 'package:dris_edward/features/cart/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final CartController controller;

  const CartItemCard({super.key, required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF88DC88), Color(0xFFE9FFE9)],
        ),
      ),
      child: Row(
        children: [
          /// Product Image
          Container(
            height: 115,
            width: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
              image: DecorationImage(
                image: AssetImage(item.productImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),

          /// Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.productName,
                        style: getNormalTextStyle(
                          fontsize: 16,
                          fontweight: FontWeight.w500,
                        ).copyWith(color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${item.totalPrice.toStringAsFixed(2)}',
                          style: getNormalTextStyle(
                            fontsize: 16,
                            fontweight: FontWeight.w500,
                          ).copyWith(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () => controller.removeItem(item.id),
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red.shade400,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.size,
                  style: getNormalTextStyle(
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                if (item.selectedExtras.isNotEmpty)
                  Text(
                    '✓ ${item.selectedExtras.join(', ')}',
                    style: getNormalTextStyle(
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                    ),
                  ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      child: Text(
                        item.deliveryTime,
                        style: getNormalTextStyle(
                          fontsize: 12,
                          fontweight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () => controller.updateQuantity(
                                  item.id,
                                  item.quantity - 1,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                child: Obx(() {
                                  final currentItem = controller.cartItems
                                      .firstWhereOrNull((i) => i.id == item.id);
                                  return Text(
                                    '${currentItem?.quantity ?? item.quantity}',
                                    style: getNormalTextStyle(
                                      fontsize: 14,
                                      fontweight: FontWeight.w500,
                                    ),
                                  );
                                }),
                              ),
                              GestureDetector(
                                onTap: () => controller.updateQuantity(
                                  item.id,
                                  item.quantity + 1,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Delete and Quantity Controls
        ],
      ),
    );
  }
}
