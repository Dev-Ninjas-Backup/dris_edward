import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dris_edward/features/Rider_flow/order_screen/model/note_model.dart';

class OrderController extends GetxController {
  
  final Rx<int> expandedIndex = 0.obs;

  final RxList<NoteModel> notes = <NoteModel>[].obs;

  final TextEditingController noteTextController = TextEditingController();

  final RxBool isLoading = false.obs;

  final Rx<String?> errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeMockData();
  }

  void _initializeMockData() {
    notes.assignAll([
      NoteModel(
        id: '1',
        date: 'APRIL 12',
        time: '10:12AM',
        text: 'I\'m So Busy Right Now.',
      ),
      NoteModel(
        id: '2',
        date: 'APRIL 12',
        time: '10:12AM',
        text: 'Busy Right Now.',
      ),
      NoteModel(
        id: '3',
        date: 'APRIL 12',
        time: '10:12AM',
        text: 'I Cant Find Your Address',
      ),
    ]);
  }


  void toggleSection(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = 0; 
    } else {
      expandedIndex.value = index;
    }
  }


  Future<void> addNote(String text) async {
    if (text.trim().isEmpty) {
      errorMessage.value = 'Note cannot be empty';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = null;

      final newNote = NoteModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        date: _getCurrentDate(),
        time: _getCurrentTime(),
        text: text.trim(),
        createdAt: DateTime.now(),
      );

      notes.insert(0, newNote);

      noteTextController.clear();
      expandedIndex.value = 0;
    } catch (e) {
      errorMessage.value = 'Error adding note: $e';
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchNotes() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

    } catch (e) {
      errorMessage.value = 'Error fetching notes: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Get current formatted date
  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'JANUARY',
      'FEBRUARY',
      'MARCH',
      'APRIL',
      'MAY',
      'JUNE',
      'JULY',
      'AUGUST',
      'SEPTEMBER',
      'OCTOBER',
      'NOVEMBER',
      'DECEMBER',
    ];
    return '${months[now.month - 1]} ${now.day}';
  }

  /// Get current formatted time
  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute$period';
  }

  /// Clear note input
  void clearNoteInput() {
    noteTextController.clear();
  }

  /// Close the expanded section
  void closeExpandedSection() {
    expandedIndex.value = 0;
  }

  @override
  void onClose() {
    noteTextController.dispose();
    super.onClose();
  }
}
