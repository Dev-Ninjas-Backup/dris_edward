import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/features/Rider_flow/profile/controller/rider_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderProfileImageWidget extends StatelessWidget {
  final RiderProfileController controller;

  const RiderProfileImageWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          /// PROFILE IMAGE
          Obx(
            () => CircleAvatar(
              radius: 70,
              backgroundImage: controller.profileImage.value != null
                  ? FileImage(controller.profileImage.value!)
                  : AssetImage(Imagepath.profileImage) as ImageProvider,
            ),
          ),

          /// CAMERA ICON BUTTON
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: controller.pickProfileImage,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
