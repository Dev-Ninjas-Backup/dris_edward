import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String rating;
  final String reviewText;
  final String imagePath;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewText,
    required this.imagePath,
    this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image + Favorite
            Stack(
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color: AppColors.buttonBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Info
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getNormalTextStyle(
                      fontsize: 16,
                      fontweight: FontWeight.w500,
                    ).copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getNormalTextStyle(
                      fontsize: 14,
                    ).copyWith(color: Colors.black54),
                  ),
                  const SizedBox(height: 6),

                  /// Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: AppColors.buttonBackgroundColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.rating} ',
                        style: getNormalTextStyle(
                          fontsize: 12,
                          fontweight: FontWeight.w500,
                        ).copyWith(color: Colors.black87),
                      ),
                      Text(
                        '(${widget.reviewText})',
                        style: getNormalTextStyle(
                          fontsize: 12,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Price + Add
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: getNormalTextStyle(
                          fontsize: 14,
                          fontweight: FontWeight.w400,
                        ).copyWith(color: Colors.black),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.buttonBackgroundColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
