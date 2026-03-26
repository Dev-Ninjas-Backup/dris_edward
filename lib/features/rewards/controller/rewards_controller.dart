import 'package:get/get.dart';

class RewardsController extends GetxController {
  var currentBalance = 40.obs;
  var pointsToNextReward = 50.obs;
  var progressPercentage = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    calculateProgress();

    // Listen to balance changes and recalculate progress
    ever(currentBalance, (_) {
      calculateProgress();
    });
  }

  void calculateProgress() {
    progressPercentage.value = (currentBalance.value / pointsToNextReward.value)
        .clamp(0.0, 1.0);
  }
}
