import 'package:dris_edward/features/customer_flow/cart/models/cart_item_model.dart';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <CartItemModel>[].obs;

  final double deliveryFee = 10.0;
  final double serviceFee = 20.0;

  RxDouble get subtotal {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total.obs;
  }

  RxDouble get totalPrice {
    return (subtotal.value + deliveryFee + serviceFee).obs;
  }

  @override
  void onInit() {
    super.onInit();
    _initializeSampleCartItems();
  }

  void _initializeSampleCartItems() {
    cartItems.add(
      CartItemModel(
        id: '1',
        productName: 'Loaded Potato',
        productImage: 'assets/images/product_1.png',
        price: 60.99,
        size: 'Small',
        selectedExtras: ['Extra Cheese'],
        deliveryTime: '12-20 min',
        quantity: 2,
      ),
    );
  }

  void removeItem(String itemId) {
    cartItems.removeWhere((item) => item.id == itemId);
  }

  void updateQuantity(String itemId, int newQuantity) {
    final itemIndex = cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      if (newQuantity > 0) {
        cartItems[itemIndex].quantity = newQuantity;
        cartItems.refresh();
      } else {
        removeItem(itemId);
      }
    }
  }

  void addMoreItems() {
    Get.toNamed(AppRoute.homeScreen);
  }

  void checkout() {
    Get.toNamed(AppRoute.checkoutScreen);
  }
}
