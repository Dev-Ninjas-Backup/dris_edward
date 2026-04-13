import 'package:get/get.dart';
import 'package:dris_edward/features/Rider_flow/request_screen/model/request_model.dart';

class RequestController extends GetxController {
  // Reactive variables wrapped in Rx
  final Rx<List<OrderRequest>> orderRequests = Rx<List<OrderRequest>>([]);
  final RxBool isLoading = RxBool(false);
  final RxString errorMessage = RxString('');
  final RxString successMessage = RxString('');

  @override
  void onInit() {
    super.onInit();
    // Load initial data - replace with API call
    loadOrderRequests();
  }

  /// Fetch order requests from API
  /// Replace this with your actual API call
  Future<void> loadOrderRequests() async {
    try {
      errorMessage('');

      // TODO: Replace with actual API call
      // var response = await apiService.getOrderRequests();

      // Mock data for now

      List<OrderRequest> mockOrders = [
        OrderRequest(
          id: '1',
          restaurantName: 'Hungry Puppets',
          itemCount: '1 Item',
          pickupAddress: 'House: 00, Road 00',
          deliveryAddress: '58.447, -101.69, Canada',
          price: '\$30.60',
          timeAgo: '2 Min ago',
          distance: '4 Km away',
          customerPickupImage: 'assets/images/customer_2.png',
          customerDeliveryImage: 'assets/images/customer_1.png',
          status: 'pending',
        ),
      ];

      orderRequests(mockOrders);
      successMessage('Orders loaded successfully');
    } catch (e) {
      errorMessage('Failed to load orders: ${e.toString()}');
    }
  }

  /// Refresh the order list
  Future<void> refreshOrderRequests() async {
    await loadOrderRequests();
  }

  /// Accept an order request
  Future<void> acceptOrder(String orderId) async {
    try {
      errorMessage('');

      // TODO: Replace with actual API call
      // var response = await apiService.acceptOrder(orderId);

      // Update the order status in the list
      final updatedOrders = orderRequests.value.map((order) {
        if (order.id == orderId) {
          return order.copyWith(status: 'accepted');
        }
        return order;
      }).toList();

      orderRequests(updatedOrders);
      successMessage('Order accepted successfully');
    } catch (e) {
      errorMessage('Failed to accept order: ${e.toString()}');
    }
  }

  /// Reject an order request
  Future<void> rejectOrder(String orderId) async {
    try {
      errorMessage('');

      // TODO: Replace with actual API call
      // var response = await apiService.rejectOrder(orderId);

      // Remove the order from the list or update status
      final updatedOrders = orderRequests.value
          .where((order) => order.id != orderId)
          .toList();

      orderRequests(updatedOrders);
      successMessage('Order rejected');
    } catch (e) {
      errorMessage('Failed to reject order: ${e.toString()}');
    }
  }

  /// Get orders by status
  List<OrderRequest> getOrdersByStatus(String status) {
    return orderRequests.value
        .where((order) => order.status == status)
        .toList();
  }

  /// Check if there are any pending orders
  bool get hasPendingOrders =>
      orderRequests.value.any((order) => order.status == 'pending');

  @override
  void onClose() {
    super.onClose();
  }
}
