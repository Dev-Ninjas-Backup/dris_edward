import 'package:flutter/material.dart';
import 'package:dris_edward/core/common/constants/imagepath.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String reviewText;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 19.0,
                backgroundImage: AssetImage(Imagepath.profileImage),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              ...List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.star,
                    color: index < rating.toInt()
                        ? const Color(0xFF0F3B1A)
                        : const Color(0xFFE6E6E6),
                    size: 16.0,
                  ),
                );
              }),
              const SizedBox(width: 8.0),
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            reviewText,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF525252),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
