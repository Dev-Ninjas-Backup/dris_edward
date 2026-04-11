import 'package:dris_edward/features/Rider_flow/notification/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isShowingNew = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 1));

      // Mock data
      final mockData = [
        NotificationModel(
          notificationId: '1',
          notificationTitle: 'Order Out for Delivery!',
          notificationSubtitle:
              'Your food is on the move! Track your order for real-time updates.!',
          notificationIconPath: Iconpath.burgerIcon,
          notificationTimeAgo: '2 minutes ago',
        ),
        NotificationModel(
          notificationId: '2',
          notificationTitle: 'Your Order is Confirmed!',
          notificationSubtitle:
              'Thanks for ordering! Your delicious meal is being prepared and will be on its way soon.',
          notificationIconPath: Iconpath.burgerIcon,
          notificationTimeAgo: '22 mins ago',
        ),
      ];

      notifications.value = mockData;
    } catch (e) {
      errorMessage.value = 'Failed to load notifications: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  void toggleView() {
    isShowingNew.value = !isShowingNew.value;
  }

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id.value == id);
    if (index != -1) {
      notifications[index].markAsRead();
    }
  }
}
