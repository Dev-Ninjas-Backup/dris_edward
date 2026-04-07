class OrderRequest {
  final String? id;
  final String restaurantName;
  final String itemCount;
  final String pickupAddress;
  final String deliveryAddress;
  final String price;
  final String timeAgo;
  final String distance;
  final String customerPickupImage;
  final String customerDeliveryImage;
  final String status; // pending, accepted, rejected

  OrderRequest({
    this.id,
    required this.restaurantName,
    required this.itemCount,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.price,
    required this.timeAgo,
    required this.distance,
    required this.customerPickupImage,
    required this.customerDeliveryImage,
    this.status = 'pending',
  });

  // Factory constructor for JSON parsing
  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return OrderRequest(
      id: json['id'] as String?,
      restaurantName: json['restaurantName'] as String? ?? 'Unknown Restaurant',
      itemCount: json['itemCount'] as String? ?? '0 Items',
      pickupAddress: json['pickupAddress'] as String? ?? 'No address',
      deliveryAddress: json['deliveryAddress'] as String? ?? 'No address',
      price: json['price'] as String? ?? '\$0.00',
      timeAgo: json['timeAgo'] as String? ?? 'Just now',
      distance: json['distance'] as String? ?? '0 Km',
      customerPickupImage:
          json['customerPickupImage'] as String? ??
          'assets/images/customer_2.png',
      customerDeliveryImage:
          json['customerDeliveryImage'] as String? ??
          'assets/images/customer_1.png',
      status: json['status'] as String? ?? 'pending',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantName': restaurantName,
      'itemCount': itemCount,
      'pickupAddress': pickupAddress,
      'deliveryAddress': deliveryAddress,
      'price': price,
      'timeAgo': timeAgo,
      'distance': distance,
      'customerPickupImage': customerPickupImage,
      'customerDeliveryImage': customerDeliveryImage,
      'status': status,
    };
  }

  // Copy with method for creating modified copies
  OrderRequest copyWith({
    String? id,
    String? restaurantName,
    String? itemCount,
    String? pickupAddress,
    String? deliveryAddress,
    String? price,
    String? timeAgo,
    String? distance,
    String? customerPickupImage,
    String? customerDeliveryImage,
    String? status,
  }) {
    return OrderRequest(
      id: id ?? this.id,
      restaurantName: restaurantName ?? this.restaurantName,
      itemCount: itemCount ?? this.itemCount,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      price: price ?? this.price,
      timeAgo: timeAgo ?? this.timeAgo,
      distance: distance ?? this.distance,
      customerPickupImage: customerPickupImage ?? this.customerPickupImage,
      customerDeliveryImage:
          customerDeliveryImage ?? this.customerDeliveryImage,
      status: status ?? this.status,
    );
  }
}
