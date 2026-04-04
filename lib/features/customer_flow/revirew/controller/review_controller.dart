import 'package:get/get.dart';
import 'package:dris_edward/features/customer_flow/revirew/model/review_model.dart';

class ReviewController extends GetxController {
  final averageRating = 4.0.obs;
  final totalReviews = 120.obs;
  final reviews = <ReviewModel>[].obs;

  final excellentCount = 75.obs;
  final goodCount = 30.obs;
  final averageCount = 12.obs;
  final poorCount = 2.obs;
  final terribleCount = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadReviews();
  }

  void loadReviews() {
    reviews.assignAll([
      ReviewModel(
        id: '1',
        name: 'Sarah Anderson',
        rating: 5.0,
        reviewText:
            'Excellent quality! The taste is amazing and perfectly brewed.',
        profileImage: 'assets/images/profile_image.png',
        createdAt: DateTime.now().subtract(Duration(days: 2)),
      ),
    ]);
  }
}
