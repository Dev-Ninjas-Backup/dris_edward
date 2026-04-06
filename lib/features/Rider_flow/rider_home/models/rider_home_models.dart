// User Profile Model
class UserProfileModel {
  final String name;
  final String joinDate;
  final String profileImage;
  final bool isOnline;

  UserProfileModel({
    required this.name,
    required this.joinDate,
    required this.profileImage,
    this.isOnline = true,
  });

  factory UserProfileModel.initial() {
    return UserProfileModel(
      name: 'Niyami Busa',
      joinDate: 'Joined 10 Aug. 2025',
      profileImage: 'assets/images/profile_image.png',
      isOnline: true,
    );
  }

  UserProfileModel copyWith({
    String? name,
    String? joinDate,
    String? profileImage,
    bool? isOnline,
  }) {
    return UserProfileModel(
      name: name ?? this.name,
      joinDate: joinDate ?? this.joinDate,
      profileImage: profileImage ?? this.profileImage,
      isOnline: isOnline ?? this.isOnline,
    );
  }
}

// Order Statistic Model
class OrderStatisticModel {
  final String value;
  final String label;

  OrderStatisticModel({required this.value, required this.label});
}

// Order Statistics Model
class OrderStatisticsModel {
  final List<OrderStatisticModel> statistics;

  OrderStatisticsModel({required this.statistics});

  factory OrderStatisticsModel.initial() {
    return OrderStatisticsModel(
      statistics: [
        OrderStatisticModel(value: '3', label: 'Today\'s\nOrder'),
        OrderStatisticModel(value: '14', label: 'This Week\nOrder'),
        OrderStatisticModel(value: '36', label: 'Total\nOrder'),
      ],
    );
  }
}

// Order Request Model
class OrderRequestModel {
  final String restaurantName;
  final String itemCount;
  final String timeAgo;
  final String pickupLocationName;
  final String deliveryLocation;
  final String deliveryDistance;
  final String restaurantImage;
  final String driverImage;

  OrderRequestModel({
    required this.restaurantName,
    required this.itemCount,
    required this.timeAgo,
    required this.pickupLocationName,
    required this.deliveryLocation,
    required this.deliveryDistance,
    required this.restaurantImage,
    required this.driverImage,
  });

  factory OrderRequestModel.initial() {
    return OrderRequestModel(
      restaurantName: 'Hungry Puppets',
      itemCount: '1 Item',
      timeAgo: '2 Min ago',
      pickupLocationName: 'Pickup form',
      deliveryLocation: '58.447132, -101.69, Canada',
      deliveryDistance: '4 Km away',
      restaurantImage: 'assets/images/profile_image.png',
      driverImage: 'assets/images/profile_image.png',
    );
  }
}
