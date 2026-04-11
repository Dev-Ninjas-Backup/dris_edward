import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/notification/widgets/notification_card.dart';
import 'package:dris_edward/features/Rider_flow/notification/widgets/notification_toggle.dart';
import 'package:dris_edward/features/Rider_flow/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Text(
                  'Notifications',
                  style: getHeadingTextStyle(
                    fontsize: 20,
                  ).copyWith(color: Colors.black),
                ),
                centerTitle: true,
              ),
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF2E5A27).withValues(alpha: .5),
                    ),
                  ),
                  child: NotificationToggle(
                    onChanged: (isNew) {
                      controller.toggleView();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => controller.isLoading.value
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF53B453),
                          ),
                        ),
                      )
                    : Obx(
                        () => controller.notifications.isEmpty
                            ? Expanded(
                                child: Center(
                                  child: Text(
                                    'No notifications',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  itemCount: controller.notifications.length,
                                  itemBuilder: (context, index) {
                                    final notification =
                                        controller.notifications[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 14,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.markAsRead(
                                            notification.id.value,
                                          );
                                        },
                                        child: NotificationCard(
                                          title: notification.title.value,
                                          subtitle: notification.subtitle.value,
                                          timeAgo: notification.timeAgo.value,
                                          iconPath: notification.iconPath.value,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
