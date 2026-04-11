class RiderProfileModel {
  final String fullName;
  final String phoneNumber;
  final String address;
  final String email;

  RiderProfileModel({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.email,
  });

  RiderProfileModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? address,
    String? email,
  }) {
    return RiderProfileModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      email: email ?? this.email,
    );
  }
}
