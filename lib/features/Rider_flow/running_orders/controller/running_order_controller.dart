import 'package:dris_edward/features/Rider_flow/running_orders/model/running_model.dart';
import 'package:get/get.dart';

class RunningOrderController extends GetxController {
  // Observable state
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final successMessage = ''.obs;

  final categories = <Map<String, dynamic>>[
    {'name': 'All', 'count': 12},
    {'name': 'Pending', 'count': 5},
    {'name': 'Accepted', 'count': 3},
    {'name': 'Confirmed', 'count': 2},
    {'name': 'Processing', 'count': 2},
  ].obs;

  final selectedCategoryIndex = 0.obs;

  // Running orders list
  final runningOrders = <RunningOrder>[].obs;
  final filteredOrders = <RunningOrder>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRunningOrders();
  }

  /// Load running orders from API
  Future<void> loadRunningOrders() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // TODO: Replace with actual API call
      // final response = await apiService.getRunningOrders();
      // runningOrders.value = (response as List)
      //     .map((o) => RunningOrder.fromJson(o))
      //     .toList();

      // Mock data for now
      runningOrders.value = _getMockRunningOrders();

      // Filter by selected category
      filterByCategory(selectedCategoryIndex.value);

      successMessage.value = 'Orders loaded successfully';
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Failed to load orders: ${e.toString()}';
      isLoading.value = false;
    }
  }

  /// Filter orders by selected category
  void filterByCategory(int index) {
    selectedCategoryIndex.value = index;

    if (index == 0) {
      // Show all orders
      filteredOrders.value = runningOrders;
    } else {
      final categoryName = categories[index]['name'];
      filteredOrders.value = runningOrders
          .where((order) => order.status == categoryName)
          .toList();
    }
  }

  /// Select category and filter
  void selectCategory(int index) {
    filterByCategory(index);
  }

  /// Mock data generator
  List<RunningOrder> _getMockRunningOrders() {
    return [
      RunningOrder(
        id: '1',
        orderId: '#ORD-2451',
        restaurantName: 'Pizza Palace',
        status: 'Pending',
        items: [
          {'name': 'Margarita Pizza', 'quantity': 2, 'price': 10.99},
          {'name': 'Fries', 'quantity': 1, 'price': 5.99},
        ],
        totalPrice: 27.97,
        pickupAddress: '123 Restaurant St, Downtown',
        deliveryAddress: '456 Customer Ave, Uptown',
        customerName: 'John Doe',
        distance: '2.5 km',
        timeAgo: '5 mins ago',
        orderDate: DateTime.now().subtract(const Duration(minutes: 5)),
        isPickedUp: false,
      ),
      RunningOrder(
        id: '2',
        orderId: '#ORD-2452',
        restaurantName: 'Burger Barn',
        status: 'Accepted',
        items: [
          {'name': 'Classic Burger', 'quantity': 2, 'price': 8.99},
          {'name': 'Coca Cola', 'quantity': 2, 'price': 2.50},
        ],
        totalPrice: 22.98,
        pickupAddress: '789 Burger Blvd, Midtown',
        deliveryAddress: '321 Delivery Lane, Suburb',
        customerName: 'Jane Smith',
        distance: '1.8 km',
        timeAgo: '10 mins ago',
        orderDate: DateTime.now().subtract(const Duration(minutes: 10)),
        isPickedUp: false,
      ),
      RunningOrder(
        id: '3',
        orderId: '#ORD-2453',
        restaurantName: 'Sushi Spot',
        status: 'Accepted',
        items: [
          {'name': 'Salmon Roll', 'quantity': 1, 'price': 12.99},
          {'name': 'Tempura', 'quantity': 1, 'price': 10.99},
        ],
        totalPrice: 23.98,
        pickupAddress: '555 Sushi St, Downtown',
        deliveryAddress: '777 Park Road, Downtown',
        customerName: 'Mike Johnson',
        distance: '3.2 km',
        timeAgo: '15 mins ago',
        orderDate: DateTime.now().subtract(const Duration(minutes: 15)),
        isPickedUp: true,
      ),
    ];
  }

  /// Clear messages
  void clearMessages() {
    errorMessage.value = '';
    successMessage.value = '';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
