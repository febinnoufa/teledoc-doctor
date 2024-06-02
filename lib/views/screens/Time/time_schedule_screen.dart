import 'package:deledocdoctor/controllers/time/displaycontroller.dart';
import 'package:deledocdoctor/views/widgets/Time/button_time_stedule.dart';
import 'package:deledocdoctor/views/widgets/Time/colonder.dart';
import 'package:deledocdoctor/views/widgets/Time/scheduled_items.dart';
import 'package:deledocdoctor/views/widgets/Time/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TimeSchedulingScreen extends StatelessWidget {
  const TimeSchedulingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DisplayController displayController = Get.put(DisplayController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Available Times",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ColenderWidget(),
            const SizedBox(height: 20),
            TimeScheduleWidget(),
            const SizedBox(height: 10),
            const TimeScheduleButtonWidget(),
            const SizedBox(height: 10),
            Obx(() {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: displayController.schedules.length,
                itemBuilder: (context, index) {
                  final schedule = displayController.schedules[index];
                  return ScheduledItem(
                    id: schedule.id,
                    date: schedule.date,
                    startTime: schedule.startTime,
                    endTime: schedule.endTime,
                    onRemove: () =>
                        displayController.removeSchedule(schedule.id),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}