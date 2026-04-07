import 'package:dris_edward/core/common/style/global_text_style.dart';
import 'package:dris_edward/features/Rider_flow/request_screen/widgets/order_request.dart';
import 'package:dris_edward/features/Rider_flow/request_screen/controller/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final RequestController controller = Get.put(RequestController());

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        title: Text(
                          'Order Request',
                          style: getHeadingTextStyle(
                            fontsize: 20,
                          ).copyWith(color: Colors.black),
                        ),
                        centerTitle: true,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            OrderRequestsList(controller: controller),
                            const SizedBox(height: 22),
                            OrderRequestsList(controller: controller),
                            const SizedBox(height: 22),
                            OrderRequestsList(controller: controller),
                          ],
                        ),
                      ),
                    ],
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
