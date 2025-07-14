import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EventFormController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final date = ''.obs;
  final time = ''.obs;
  final durationController = TextEditingController();
  final locationController = TextEditingController();

  void selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      date.value = '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  void selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      time.value = picked.format(context);
    }
  }
}
