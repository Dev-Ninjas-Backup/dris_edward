import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 1.obs;

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
