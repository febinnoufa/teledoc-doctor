import 'package:deledocdoctor/controllers/time/displaycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduledItem extends StatelessWidget {
  final String id;
  final String date;
  final String startTime;
  final String endTime;


   ScheduledItem({super.key, 
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,

  });

   final DisplayController displayController = Get.put(DisplayController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Date: $date',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // displayController.deleteSchedule(id);
                   displayController.removeSchedule(id);
                },
               // onPressed: onRemove
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                ' $startTime',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 20),
              const Text("to"),
              const SizedBox(width: 20),
              Text(
                ' $endTime',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
