import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationToggle extends StatelessWidget {
  final Function(bool isNew)? onChanged;
  final RxBool isNewSelected;

  NotificationToggle({super.key, this.onChanged, RxBool? isNewSelected})
    : isNewSelected = isNewSelected ?? true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                isNewSelected.value = true;
                if (onChanged != null) onChanged!(true);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isNewSelected.value
                      ? const Color(0xFF2E5A27)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'New',
                  style: TextStyle(
                    color: isNewSelected.value ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                isNewSelected.value = false;
                if (onChanged != null) onChanged!(false);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isNewSelected.value
                      ? const Color(0xFF2E5A27)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Old',
                  style: TextStyle(
                    color: !isNewSelected.value ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
