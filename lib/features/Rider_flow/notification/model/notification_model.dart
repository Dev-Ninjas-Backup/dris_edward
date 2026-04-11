import 'package:get/get.dart';

class NotificationModel extends GetxController {
  final RxString id = ''.obs;
  final RxString title = ''.obs;
  final RxString subtitle = ''.obs;
  final RxString iconPath = ''.obs;
  final RxString timeAgo = ''.obs;
  final RxBool isRead = false.obs;
  // final RxDateTime createdAt = DateTime.now().obs;

  NotificationModel({
    required String notificationId,
    required String notificationTitle,
    required String notificationSubtitle,
    required String notificationIconPath,
    required String notificationTimeAgo,
    bool read = false,
    DateTime? createdDateTime,
  }) {
    id.value = notificationId;
    title.value = notificationTitle;
    subtitle.value = notificationSubtitle;
    iconPath.value = notificationIconPath;
    timeAgo.value = notificationTimeAgo;
    isRead.value = read;
    // createdAt.value = createdDateTime ?? DateTime.now();
  }

  /// Factory to create from JSON (API response)
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['id'] ?? '',
      notificationTitle: json['title'] ?? '',
      notificationSubtitle: json['message'] ?? json['subtitle'] ?? '',
      notificationIconPath: json['icon'] ?? '',
      notificationTimeAgo:
          json['timeAgo'] ?? _calculateTimeAgo(json['createdAt']),
      read: json['isRead'] ?? false,
      createdDateTime: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() => {
    'id': id.value,
    'title': title.value,
    'message': subtitle.value,
    'icon': iconPath.value,
    'isRead': isRead.value,
    // 'createdAt': createdAt.value.toIso8601String(),
  };

  /// Calculate time ago from timestamp
  static String _calculateTimeAgo(dynamic timestamp) {
    if (timestamp == null) return 'just now';

    try {
      final DateTime? dateTime = timestamp is String
          ? DateTime.tryParse(timestamp)
          : (timestamp is DateTime ? timestamp : null);

      if (dateTime == null) return 'just now';

      final Duration difference = DateTime.now().difference(dateTime);

      if (difference.inSeconds < 60) {
        return 'just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hours ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else {
        return '${difference.inDays ~/ 7} weeks ago';
      }
    } catch (e) {
      return 'just now';
    }
  }

  /// Mark notification as read
  void markAsRead() {
    isRead.value = true;
  }

  /// Toggle read status
  void toggleReadStatus() {
    isRead.value = !isRead.value;
  }

  @override
  String toString() =>
      'NotificationModel(id: ${id.value}, title: ${title.value})';
}
