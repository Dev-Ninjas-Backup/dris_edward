class RunningOrder {
  final String id;
  final String orderId;
  final String restaurantName;
  final String status;
  final List<Map<String, dynamic>> items;
  final double totalPrice;
  final String pickupAddress;
  final String deliveryAddress;
  final String customerName;
  final String distance;
  final String timeAgo;
  final DateTime orderDate;
  final bool isPickedUp;

  RunningOrder({
    required this.id,
    required this.orderId,
    required this.restaurantName,
    required this.status,
    required this.items,
    required this.totalPrice,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.customerName,
    required this.distance,
    required this.timeAgo,
    required this.orderDate,
    this.isPickedUp = false,
  });

  factory RunningOrder.fromJson(Map<String, dynamic> json) {
    return RunningOrder(
      id: json['id'] ?? '',
      orderId: json['orderId'] ?? '',
      restaurantName: json['restaurantName'] ?? '',
      status: json['status'] ?? 'Pending',
      items: List<Map<String, dynamic>>.from(json['items'] ?? []),
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      pickupAddress: json['pickupAddress'] ?? '',
      deliveryAddress: json['deliveryAddress'] ?? '',
      customerName: json['customerName'] ?? '',
      distance: json['distance'] ?? '0 km',
      timeAgo: json['timeAgo'] ?? '',
      orderDate: json['orderDate'] != null
          ? DateTime.parse(json['orderDate'])
          : DateTime.now(),
      isPickedUp: json['isPickedUp'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'restaurantName': restaurantName,
      'status': status,
      'items': items,
      'totalPrice': totalPrice,
      'pickupAddress': pickupAddress,
      'deliveryAddress': deliveryAddress,
      'customerName': customerName,
      'distance': distance,
      'timeAgo': timeAgo,
      'orderDate': orderDate.toIso8601String(),
      'isPickedUp': isPickedUp,
    };
  }

  RunningOrder copyWith({
    String? id,
    String? orderId,
    String? restaurantName,
    String? status,
    List<Map<String, dynamic>>? items,
    double? totalPrice,
    String? pickupAddress,
    String? deliveryAddress,
    String? customerName,
    String? distance,
    String? timeAgo,
    DateTime? orderDate,
    bool? isPickedUp,
  }) {
    return RunningOrder(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      restaurantName: restaurantName ?? this.restaurantName,
      status: status ?? this.status,
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      customerName: customerName ?? this.customerName,
      distance: distance ?? this.distance,
      timeAgo: timeAgo ?? this.timeAgo,
      orderDate: orderDate ?? this.orderDate,
      isPickedUp: isPickedUp ?? this.isPickedUp,
    );
  }
}
