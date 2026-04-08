// import 'package:flutter/material.dart';
// import 'package:dris_edward/core/common/style/global_text_style.dart';

// class NotificationCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String timeAgo;
//   final String iconPath;

//   const NotificationCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.timeAgo,
//     required this.iconPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.1),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Icon Container
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF5F5F5),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Center(
//               child: Image.asset(
//                 iconPath,
//                 width: 28,
//                 height: 28,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Text Content
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: getNormalTextStyle(
//                     fontsize: 14,
//                     fontweight: FontWeight.w600,
//                   ).copyWith(color: Colors.black),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: getNormalTextStyle(
//                     fontsize: 12,
//                     fontweight: FontWeight.w400,
//                   ).copyWith(color: Colors.black54),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8),
//           // Time Badge
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: const Color(0xFFE8F5E9),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               timeAgo,
//               style: getNormalTextStyle(
//                 fontsize: 11,
//                 fontweight: FontWeight.w500,
//               ).copyWith(color: const Color(0xFF54A312)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
