class OrderDetail {
  final String restaurantName;
  final String restaurantImage;
  final String date;
  final String time;
  final String price;
  final String orderId;
  final String deliveryImage;
  final String driverName;
  final String driverImage;
  final String driverStatus;
  final String subtotal;
  final String deliveryFee;
  final String serviceFee;
  final String total;

  OrderDetail({
    required this.restaurantName,
    required this.restaurantImage,
    required this.date,
    required this.time,
    required this.price,
    required this.orderId,
    required this.deliveryImage,
    required this.driverName,
    required this.driverImage,
    required this.driverStatus,
    required this.subtotal,
    required this.deliveryFee,
    required this.serviceFee,
    required this.total,
  });
}
