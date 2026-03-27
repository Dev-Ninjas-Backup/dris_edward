// ignore_for_file: deprecated_member_use
import 'package:dris_edward/core/common/constants/app_colors.dart';
import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/constants/profile_custom_obscure_textfield.dart';
import 'package:dris_edward/core/common/constants/profile_custom_textfield.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/profile_info/controller/profile_info_controller.dart';
import 'package:dris_edward/features/profile_info/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileInfoController());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF53B453), Colors.white, Colors.white],
          stops: [0.1, 0.4, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER WITH BACK BUTTON AND TITLE
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  title: Text(
                    'Profile Information',
                    style: getHeadingTextStyle(
                      fontsize: 24,
                      fontweight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: true,
                ),
                const SizedBox(height: 8),

                /// PROFILE IMAGE WITH CAMERA ICON
                ProfileImageWidget(controller: controller),

                /// FORM CONTENT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// PERSONAL DETAILS HEADING
                    SizedBox(height: 20),
                    Text(
                      'Personal Details',
                      style: getHeadingTextStyle(
                        fontsize: 24,
                        fontweight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// FULL NAME FIELD
                    Text(
                      'Full name',
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileCustomTextfield(
                      controller: controller.fullNameController,
                      hintText: 'Nicolas chakma',
                    ),

                    const SizedBox(height: 16),

                    /// PHONE NUMBER FIELD
                    Text(
                      'Phone Number',
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileCustomTextfield(
                      controller: controller.phoneNumberController,
                      hintText: '+1 (555) 123-4567',
                    ),

                    const SizedBox(height: 16),

                    /// ADDRESS FIELD
                    Text(
                      'Address',
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileCustomTextfield(
                      controller: controller.addressController,
                      hintText: 'Dhanmondi central road',
                    ),

                    const SizedBox(height: 16),

                    /// EMAIL FIELD
                    Text(
                      'Email',
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileCustomTextfield(
                      controller: controller.emailController,
                      hintText: 'nicoaschakma344@gmail.com',
                    ),

                    const SizedBox(height: 24),

                    /// PASSWORD SECTION
                    Text(
                      'Password',
                      style: getHeadingTextStyle(
                        fontsize: 16,
                        fontweight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// CURRENT PASSWORD FIELD
                    Text(
                      'Current password',
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileCustomObsecureTextfield(
                      controller: controller.currentPasswordController,
                      hintText: 'Current password',
                    ),

                    const SizedBox(height: 16),

                    /// NEW PASSWORD FIELD
                    Text(
                      'New password',
                      style: getNormalTextStyle(
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProfileCustomObsecureTextfield(
                      controller: controller.newPasswordController,
                      hintText: 'New password',
                    ),

                    const SizedBox(height: 30),

                    /// ACTION BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: OutlinedButton(
                              onPressed: controller.cancel,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: AppColors.buttonBackgroundColor,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 13,
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                'Cancel',
                                style:
                                    getNormalTextStyle(
                                      fontsize: 20,
                                      fontweight: FontWeight.w600,
                                    ).copyWith(
                                      color: AppColors.buttonBackgroundColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ElevatedButton(
                              onPressed: controller.saveChanges,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.buttonBackgroundColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                elevation: 2,
                                shadowColor: Colors.black.withOpacity(0.2),
                              ),
                              child: Text(
                                'Save Changes',
                                style: getNormalTextStyle(
                                  fontsize: 20,
                                  fontweight: FontWeight.w600,
                                ).copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// DELETE ACCOUNT BUTTON
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: GestureDetector(
                          onTap: controller.deleteAccount,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDECEC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Iconpath.deleteIcon,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Delete Account',
                                  style: getNormalTextStyle(
                                    fontsize: 16,
                                    fontweight: FontWeight.w500,
                                  ).copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 65),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
