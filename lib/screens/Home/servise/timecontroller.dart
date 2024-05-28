import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeScheduleController extends GetxController {
  var startTime = Rx<TimeOfDay?>(null);
  var endTime = Rx<TimeOfDay?>(null);

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? (startTime.value ?? TimeOfDay.now())
          : (endTime.value ?? TimeOfDay.now()),
    );
    if (picked != null) {
      if (isStartTime) {
        startTime.value = picked;
      } else {
        endTime.value = picked;
      }
    }
  }
}
