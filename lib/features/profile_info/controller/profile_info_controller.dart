import 'dart:io';
import 'package:dris_edward/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoController extends GetxController {
  // Text controllers for form fields
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;

  // Loading state
  RxBool isLoading = false.obs;

  // Profile image
  Rx<File?> profileImage = Rx<File?>(null);

  // Image picker
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with existing user data
    fullNameController = TextEditingController(text: 'Nicolas chakma');
    phoneNumberController = TextEditingController(text: '+1 (555) 123-4567');
    addressController = TextEditingController(text: 'Dhanmondi central road');
    emailController = TextEditingController(text: 'nicoaschakma344@gmail.com');
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }

  /// Save profile changes
  void saveChanges() {
    isLoading.value = true;

    // Validate inputs
    if (fullNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        addressController.text.isEmpty ||
        emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFFE74C3C),
        colorText: Colors.white,
      );
      isLoading.value = false;
      return;
    }

    // TODO: Call API to save profile changes
    // Example: await profileService.updateProfile(...)

    isLoading.value = false;
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xFF53B453),
      colorText: Colors.white,
    );
  }

  /// Cancel and go back
  void cancel() {
    Get.back();
  }

  /// Delete account
  void deleteAccount() {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              // TODO: Call API to delete account
              Get.back(); // Close dialog
              Get.offAllNamed(AppRoute.loginScreen); // Navigate to login
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Color(0xFFE74C3C)),
            ),
          ),
        ],
      ),
    );
  }

  /// Pick image from camera or gallery
  void pickProfileImage() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        Get.snackbar(
          'Success',
          'Profile image updated',
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xFF53B453),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFFE74C3C),
        colorText: Colors.white,
      );
    }
  }
}
