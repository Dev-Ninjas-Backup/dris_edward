import 'package:get/get.dart';

class HomeController extends GetxController {
  final categories = <String>[
    'All',
    'Potato Bowls',
    'Baked Potatoes',
    'Soups',
    'Desserts',
    'Coffee',
    'Soft Drinks',
  ].obs;
  // Currently selected category index (0 = 'All' by default)
  final selectedCategoryIndex = 0.obs;

  final bannerImages = <String>[
    'assets/images/offer_image_1.png',
    'assets/images/offer_image_2.png',
    'assets/images/offer_image_3.png',
  ].obs;

  final currentBannerIndex = 0.obs;

  final products = <Map<String, String>>[
    {
      'title': 'BBQ Chicken Bowl',
      'description': 'Tender pulled chicken with smoky BBQ sauce...',
      'price': '\$8.99',
      'rating': '4.8',
      'reviews': '24 review',
      'image': 'assets/images/product_1.png',
    },
    {
      'title': 'Loaded Potato Bowl',
      'description': 'Tender pulled chicken with smoky BBQ sauce...',
      'price': '\$8.99',
      'rating': '4.9',
      'reviews': '24 review',
      'image': 'assets/images/product_2.png',
    },
    {
      'title': 'Veggie Delight Bowl',
      'description': 'Tender pulled chicken with smoky BBQ sauce...',
      'price': '\$8.99',
      'rating': '4.7',
      'reviews': '24 review',
      'image': 'assets/images/product_3.png',
    },
    {
      'title': 'Spicy Mexican Bowl',
      'description': 'Tender pulled chicken with smoky BBQ sauce...',
      'price': '\$8.99',
      'rating': '4.8',
      'reviews': '24 review',
      'image': 'assets/images/product_4.png',
    },
  ].obs;

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}
