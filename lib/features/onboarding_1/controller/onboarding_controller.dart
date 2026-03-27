import 'package:get/get.dart';
import '../../../core/common/constants/imagepath.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 1.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'image': Imagepath.onboarding1Image,
      'title': 'Craving Something Delicious?',
      'description':
          'Explore freshly prepared meals from our kitchen and order your favourites in just a few taps.',
    },
    {
      'image': Imagepath.onboarding2Image,
      'title': 'Order in Seconds',
      'description':
          'Browse the menu, customize your meal, and place your order quickly and effortlessly.',
    },
    {
      'image': Imagepath.onboarding3Image,
      'title': 'Delivered Fresh to Your Door',
      'description':
          'We prepare your food with care and deliver it hot and fresh, right on time.',
    },
  ];

  void nextPage() {
    if (currentPage.value < 3) {
      currentPage.value++;
    } else {
      navigateToOnboarding4();
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    } else if (currentPage.value == 1) {
      Get.back();
    }
  }

  void navigateToPage(int page) {
    if (page >= 1 && page <= 3) {
      currentPage.value = page;
    }
  }

  void navigateToOnboarding4() {
    Get.toNamed(AppRoute.onboarding4);
  }

  bool isFirstPage() => currentPage.value == 1;
  bool isLastPage() => currentPage.value == 3;
  bool isActiveDot(int page) => currentPage.value == page;
}
