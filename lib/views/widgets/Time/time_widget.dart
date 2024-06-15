import 'package:deledocdoctor/controllers/time/timecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeScheduleWidget extends StatelessWidget {
  final TimeScheduleController timeController =
      Get.put(TimeScheduleController());

  TimeScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              timeController.selectTime(context, true);
            },
            child: Obx(() => Container(
                  width: 145,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        timeController.startTime.value != null
                            ? 'Start: ${timeController.startTime.value!.format(context)}'
                            : 'Start Time',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                )),
          ),
          const SizedBox(width: 20),
          const Text("to"),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              timeController.selectTime(context, false);
            },
            child: Obx(() => Container(
                  width: 140,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        timeController.endTime.value != null
                            ? 'End: ${timeController.endTime.value!.format(context)}'
                            : 'End Time',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
