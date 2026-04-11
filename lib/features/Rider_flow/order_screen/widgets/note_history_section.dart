import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/controller/order_controller.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/model/note_model.dart';

class NoteHistorySection extends StatelessWidget {
  final OrderController? controller;

  const NoteHistorySection({super.key, OrderController? controller})
    : controller = controller;

  @override
  Widget build(BuildContext context) {
    final orderController = controller ?? Get.find<OrderController>();

    return Column(
      children: [
        _TabButtonsRow(controller: orderController),
        const SizedBox(height: 20),

        Obx(() {
          return AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _buildExpandedContent(orderController),
          );
        }),
      ],
    );
  }

  Widget _buildExpandedContent(OrderController controller) {
    if (controller.expandedIndex.value == 1) {
      return _AddNoteSection(controller: controller);
    } else if (controller.expandedIndex.value == 2) {
      return _HistorySection(controller: controller);
    }
    return const SizedBox.shrink(); // Hidden state
  }
}

class _TabButtonsRow extends StatelessWidget {
  final OrderController controller;

  const _TabButtonsRow({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => _TabButton(
            label: 'Add Note',
            isSelected: controller.expandedIndex.value == 1,
            onTap: () => controller.toggleSection(1),
          ),
        ),
        const SizedBox(width: 12),
        Obx(
          () => _TabButton(
            label: 'History',
            isSelected: controller.expandedIndex.value == 2,
            onTap: () => controller.toggleSection(2),
          ),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2E5A27) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF2E5A27)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF2E5A27),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _AddNoteSection extends StatelessWidget {
  final OrderController controller;

  const _AddNoteSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller.noteTextController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Note.......',
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => controller.closeExpandedSection(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.addNote(
                            controller.noteTextController.text,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E5A27),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
          Obx(
            () => controller.errorMessage.value != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      controller.errorMessage.value!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _HistorySection extends StatelessWidget {
  final OrderController controller;

  const _HistorySection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final historyData = controller.notes;

        if (historyData.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'No notes yet',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: historyData.length,
          itemBuilder: (context, index) {
            return _NoteTimelineItem(
              note: historyData[index],
              isLast: index == historyData.length - 1,
            );
          },
        );
      }),
    );
  }
}

class _NoteTimelineItem extends StatelessWidget {
  final NoteModel note;
  final bool isLast;

  const _NoteTimelineItem({required this.note, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                note.date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                note.time,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFF2E5A27),
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(width: 3, height: 60, color: const Color(0xFF2E5A27)),
          ],
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              note.text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
