class RiderModel {
  final String name;
  final String profileImagePath;
  final int ridesCompleted;
  final double rating;
  final bool systemNotification;

  RiderModel({
    required this.name,
    required this.profileImagePath,
    required this.ridesCompleted,
    required this.rating,
    this.systemNotification = false,
  });

  // Create a copy with modified fields
  RiderModel copyWith({
    String? name,
    String? profileImagePath,
    int? ridesCompleted,
    double? rating,
    bool? systemNotification,
  }) {
    return RiderModel(
      name: name ?? this.name,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      ridesCompleted: ridesCompleted ?? this.ridesCompleted,
      rating: rating ?? this.rating,
      systemNotification: systemNotification ?? this.systemNotification,
    );
  }
}
