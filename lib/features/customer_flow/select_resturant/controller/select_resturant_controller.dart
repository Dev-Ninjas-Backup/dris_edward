import 'package:dris_edward/features/customer_flow/select_resturant/models/store_model.dart';
import 'package:get/get.dart';

class SelectResturantController extends GetxController {
  final stores = <StoreModel>[
    StoreModel(
      id: '1',
      name: 'King Edward Downtown',
      address: '123 Main St City Center',
      distance: 0.5,
      unit: 'km',
      status: 'Open',
      isOpen: true,
    ),
    StoreModel(
      id: '2',
      name: 'King Edward Westside',
      address: '456 Oak Avenue Mall Plaza',
      distance: 2.3,
      unit: 'km',
      status: 'Open',
      isOpen: true,
    ),
    StoreModel(
      id: '3',
      name: 'King Edward Mall',
      address: '789 Park Street Downtown',
      distance: 4.1,
      unit: 'km',
      status: 'Open',
      isOpen: true,
    ),
  ].obs;

  final selectedStore = Rx<StoreModel?>(null);

  void selectStore(StoreModel store) {
    selectedStore.value = store;
  }
}
