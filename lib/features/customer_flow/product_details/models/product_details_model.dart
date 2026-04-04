class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String imagePath;
  final List<String> availableSizes;
  final List<IngredientModel> ingredients;
  final List<String> allergyInfo;
  final List<ExtraModel> extras;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    required this.availableSizes,
    required this.ingredients,
    required this.allergyInfo,
    required this.extras,
  });
}

class IngredientModel {
  final String name;

  IngredientModel({required this.name});
}

class ExtraModel {
  final String name;
  final double additionalPrice;
  bool isSelected;

  ExtraModel({
    required this.name,
    required this.additionalPrice,
    this.isSelected = false,
  });
}
