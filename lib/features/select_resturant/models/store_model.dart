class StoreModel {
  final String id;
  final String name;
  final String address;
  final double distance;
  final String unit;
  final String status;
  final bool isOpen;

  StoreModel({
    required this.id,
    required this.name,
    required this.address,
    required this.distance,
    required this.unit,
    required this.status,
    required this.isOpen,
  });
}
