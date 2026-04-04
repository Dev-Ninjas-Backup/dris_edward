class CartItemModel {
  final String id;
  final String productName;
  final String productImage;
  final double price;
  final String size;
  final List<String> selectedExtras;
  final String deliveryTime;
  int quantity;

  CartItemModel({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.size,
    required this.selectedExtras,
    required this.deliveryTime,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}
