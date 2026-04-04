import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/customer_flow/select_resturant/models/store_model.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;
  final VoidCallback onTap;

  const StoreCard({super.key, required this.store, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Iconpath.locationIcon, height: 24, width: 24),
            const SizedBox(width: 10),

            /// MAIN CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header (Name + Status)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Store Name & Address
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.name,
                              style: getNormalTextStyle(
                                fontsize: 16,
                                fontweight: FontWeight.w500,
                              ).copyWith(color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              store.address,
                              style: getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                              ).copyWith(color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      /// Status Badge
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: store.isOpen
                              ? const Color(0xFFE6EDE6)
                              : const Color(0xFFFFEBEE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          store.status,
                          style:
                              getNormalTextStyle(
                                fontsize: 14,
                                fontweight: FontWeight.w500,
                              ).copyWith(
                                color: store.isOpen
                                    ? AppColors.buttonBackgroundColor
                                    : const Color(0xFFF44336),
                              ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Distance + Arrow
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${store.distance} ${store.unit} away',
                          style: getNormalTextStyle(
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                          ).copyWith(color: Colors.grey),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 24),
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
