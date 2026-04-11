import 'package:flutter/material.dart';

class RestaurantDetailCard extends StatelessWidget {
  final String title;
  final String role;
  final String itemCount;
  final String address;
  final String imageUrl;
  final VoidCallback? onPhonePressed;
  final VoidCallback? onChatPressed;

  const RestaurantDetailCard({
    super.key,
    required this.title,
    required this.role,
    required this.itemCount,
    required this.address,
    required this.imageUrl,
    this.onPhonePressed,
    this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Flex(
            direction: Axis.horizontal,
            children: [
              CircleAvatar(radius: 20, backgroundImage: AssetImage(imageUrl)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      itemCount,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0XFF363A33),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0XFF363A33),
                      ),
                    ),
                  ],
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  IconButton(
                    onPressed: onPhonePressed,
                    icon: const Icon(Icons.phone_in_talk_outlined),
                    color: const Color(0xFF306730),
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                  ),
                  IconButton(
                    onPressed: onChatPressed,
                    icon: const Icon(Icons.chat_bubble_outline),
                    color: const Color(0xFF306730),
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
