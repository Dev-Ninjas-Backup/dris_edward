import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/features/Rider_flow/rider_account/model/rider_model.dart';
import 'package:get/get.dart';

class RiderAccountController extends GetxController {
  late Rx<RiderModel> riderData;
  RxBool systemNotificationEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    riderData = RiderModel(
      name: 'Rider Name',
      profileImagePath: Imagepath.profileImage,
      ridesCompleted: 10,
      rating: 4.8,
      systemNotification: false,
    ).obs;

    systemNotificationEnabled.value = false;
  }

  // Method to toggle system notification
  void toggleSystemNotification(bool value) {
    systemNotificationEnabled.value = value;
    riderData.value = riderData.value.copyWith(systemNotification: value);
  }

  void logout() {

  }

  // Method to edit profile
  void editProfile() {
  }

  // Method to update rider name
  void updateRiderName(String newName) {
    riderData.value = riderData.value.copyWith(name: newName);
  }

  // Method to update rides completed
  void updateRidesCompleted(int rides) {
    riderData.value = riderData.value.copyWith(ridesCompleted: rides);
  }

  // Method to update rating
  void updateRating(double newRating) {
    riderData.value = riderData.value.copyWith(rating: newRating);
  }
}
