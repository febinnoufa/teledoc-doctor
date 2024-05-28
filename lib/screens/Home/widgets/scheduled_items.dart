import 'package:flutter/material.dart';

class ScheduledItem extends StatelessWidget {
  final String id;
  final String date;
  final String startTime;
  final String endTime;
  final VoidCallback? onRemove;

  const ScheduledItem({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.onRemove,
  });

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
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 80,),
              Text(
                'Date: $date',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
               SizedBox(width: 40,),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onRemove,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 60),
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
