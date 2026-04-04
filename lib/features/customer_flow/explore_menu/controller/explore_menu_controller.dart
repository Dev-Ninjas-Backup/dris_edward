import 'package:get/get.dart';

class ExploreMenuController extends GetxController {
  // Search query
  final searchQuery = ''.obs;

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void clearSearch() {
    searchQuery.value = '';
  }
}
