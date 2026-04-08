import 'package:dris_edward/core/common/constants/iconpath.dart';
import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/rider_account/controller/reider_account_controller.dart';
import 'package:dris_edward/features/Rider_flow/rider_account/widgets/custom_switch_row.dart';
import 'package:dris_edward/features/Rider_flow/rider_account/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderAccountScreen extends StatelessWidget {
  const RiderAccountScreen({super.key});

  void _showLogoutDialog(
    BuildContext context,
    RiderAccountController controller,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.logout();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final RiderAccountController controller = Get.put(RiderAccountController());

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
        body: SafeArea(
          child: ListView(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Text(
                  'Account',
                  style: getHeadingTextStyle(
                    fontsize: 20,
                  ).copyWith(color: Colors.black),
                ),
                centerTitle: true,
              ),
              const SizedBox(height: 32),
              Obx(
                () => Column(
                  children: [
                    Image.asset(
                      controller.riderData.value.profileImagePath,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      controller.riderData.value.name,
                      style: getHeadingTextStyle(fontsize: 22),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: StatCard(
                          value: controller.riderData.value.ridesCompleted
                              .toString(),
                          label: 'Rides Completed',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: StatCard(
                          value: controller.riderData.value.rating.toString(),
                          label: 'Rating',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomSettingTile(
                  title: 'Edit Profile',
                  iconPath: Iconpath.pen,
                  showToggle: false,
                  onTap: () {
                    controller.editProfile();
                  },
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomSettingTile(
                  title: 'Terms & Condition',
                  iconPath: '',
                  icon: Icons.privacy_tip_outlined,
                  showToggle: false,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomSettingTile(
                  title: 'Terms & Condition',
                  iconPath: '',
                  icon: Icons.note_add_outlined,
                  showToggle: false,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Obx(
                  () => CustomSettingTile(
                    title: 'System notification',
                    iconPath: '',
                    icon: Icons.notifications,
                    showToggle: true,
                    initialToggleValue:
                        controller.systemNotificationEnabled.value,
                    onToggleChanged: (value) {
                      controller.toggleSystemNotification(value);
                    },
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomSettingTile(
                  title: 'Change Password',
                  iconPath: '',
                  icon: Icons.lock,
                  showToggle: false,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 34),
              Center(
                child: SizedBox(
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      _showLogoutDialog(context, controller);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Iconpath.logoutIcon,
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'Logout',
                            style: getNormalTextStyle(
                              fontsize: 16,
                              fontweight: FontWeight.bold,
                            ).copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
