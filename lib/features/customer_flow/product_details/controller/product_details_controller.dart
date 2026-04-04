import 'package:dris_edward/features/customer_flow/product_details/models/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late ProductDetailsModel product;

  final selectedSize = 'Small'.obs;
  late final ingredients = <IngredientModel>[].obs;
  late final extras = <ExtraModel>[].obs;
  final isFavorite = false.obs;

  RxDouble get totalPrice {
    double total = product.price;

    // Add selected extras price
    for (var extra in extras) {
      if (extra.isSelected) {
        total += extra.additionalPrice;
      }
    }

    return total.obs;
  }

  @override
  void onInit() {
    super.onInit();
    _initializeProduct();
  }

  void _initializeProduct() {
    // Check if product data was passed via arguments
    final args = Get.arguments;

    if (args != null && args is Map<String, dynamic>) {
      // Create product from passed data
      product = ProductDetailsModel(
        id: args['id'] ?? '1',
        title: args['title'] ?? 'Product',
        description: args['description'] ?? 'Product description',
        price: double.tryParse(args['price'].toString()) ?? 60.00,
        rating: double.tryParse(args['rating'].toString()) ?? 4.8,
        reviewCount: int.tryParse(args['reviewCount'].toString()) ?? 24,
        imagePath: args['imagePath'] ?? 'assets/images/product_1.png',
        availableSizes: ['Small', 'Medium', 'Large'],
        ingredients: [
          IngredientModel(name: 'Bacon Bits'),
          IngredientModel(name: 'Cheddar Cheese'),
          IngredientModel(name: 'Sour Cream'),
          IngredientModel(name: 'Green Onions'),
        ],
        allergyInfo: ['Milk', 'Dairy', 'Gluten', 'Soy', 'Eggs'],
        extras: [
          ExtraModel(
            name: 'Extra Cheese',
            additionalPrice: 1.50,
            isSelected: false,
          ),
          ExtraModel(
            name: 'Extra Bacon',
            additionalPrice: 1.50,
            isSelected: false,
          ),
          ExtraModel(
            name: 'Jalapenos',
            additionalPrice: 1.50,
            isSelected: false,
          ),
        ],
      );
    } else {
      // Initialize with sample data if no arguments passed
      product = ProductDetailsModel(
        id: '1',
        title: 'Loaded Potato Bowl',
        description:
            'Crispy potato chunks topped with bacon, cheddar cheese, and sour cream.',
        price: 60.00,
        rating: 4.8,
        reviewCount: 24,
        imagePath: 'assets/images/product_1.png',
        availableSizes: ['Small', 'Medium', 'Large'],
        ingredients: [
          IngredientModel(name: 'Bacon Bits'),
          IngredientModel(name: 'Cheddar Cheese'),
          IngredientModel(name: 'Sour Cream'),
          IngredientModel(name: 'Green Onions'),
        ],
        allergyInfo: ['Milk', 'Dairy', 'Gluten', 'Soy', 'Eggs'],
        extras: [
          ExtraModel(
            name: 'Extra Cheese',
            additionalPrice: 1.50,
            isSelected: false,
          ),
          ExtraModel(
            name: 'Extra Bacon',
            additionalPrice: 1.50,
            isSelected: false,
          ),
          ExtraModel(
            name: 'Jalapenos',
            additionalPrice: 1.50,
            isSelected: false,
          ),
        ],
      );
    }

    ingredients.assignAll(product.ingredients);
    extras.assignAll(product.extras);
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  // void toggleIngredient(int index) {
  //   ingredients[index].isSelected = !ingredients[index].isSelected;
  //   ingredients.refresh();
  // }

  void toggleExtra(int index) {
    extras[index].isSelected = !extras[index].isSelected;
    extras.refresh();
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void addToCart() {
    // TODO: Implement add to cart functionality
  }
}
