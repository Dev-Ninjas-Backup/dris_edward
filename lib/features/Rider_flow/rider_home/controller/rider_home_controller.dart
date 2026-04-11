import 'package:get/get.dart';
import 'package:dris_edward/features/Rider_flow/rider_home/models/rider_home_models.dart';

class RiderHomeController extends GetxController {
  final userProfile = UserProfileModel.initial().obs;
  final orderStatistics = OrderStatisticsModel.initial().obs;
  final orderRequest = OrderRequestModel.initial().obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
    loadOrderStatistics();
    loadOrderRequest();
  }

  // User Profile Methods
  void loadUserProfile() async {
    try {
      isLoading(true);

      await Future.delayed(Duration(seconds: 1)); // Simulate API delay
      userProfile.value = UserProfileModel.initial();
    } catch (e) {
      errorMessage.value = 'Failed to load user profile: $e';
    } finally {
      isLoading(false);
    }
  }

  void toggleOnlineStatus() {
    userProfile.value = userProfile.value.copyWith(
      isOnline: !userProfile.value.isOnline,
    );
   
  }

  void loadOrderStatistics() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 1)); 
      orderStatistics.value = OrderStatisticsModel.initial();
    } catch (e) {
      errorMessage.value = 'Failed to load order statistics: $e';
    } finally {
      isLoading(false);
    }
  }

  void loadOrderRequest() async {
    try {
      isLoading(true);

      await Future.delayed(Duration(seconds: 1)); 
      orderRequest.value = OrderRequestModel.initial();
    } catch (e) {
      errorMessage.value = 'Failed to load order request: $e';
    } finally {
      isLoading(false);
    }
  }

  void acceptOrder() {
    try {
      isLoading(true);
      Get.snackbar('Success', 'Order accepted successfully');
    } catch (e) {
      errorMessage.value = 'Failed to accept order: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  void ignoreOrder() {
    try {
      isLoading(true);
      Get.snackbar('Success', 'Order ignored');
    } catch (e) {
      errorMessage.value = 'Failed to ignore order: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  void viewAllOrders() {
  }
}
