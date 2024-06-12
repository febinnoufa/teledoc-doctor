import 'package:deledocdoctor/controllers/time/colondercontroller.dart';
import 'package:deledocdoctor/controllers/time/displaycontroller.dart';
import 'package:deledocdoctor/controllers/time/timecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TimeScheduleButtonWidget extends StatelessWidget {
  const TimeScheduleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = Get.find<CalendarController>();
    final TimeScheduleController timeController = Get.find<TimeScheduleController>();
    final DisplayController displayController = Get.find<DisplayController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 98, 186, 126),
            elevation: 0,
          ),
          onPressed: () async{
            if (calendarController.selectedDay.value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select a date.'),
                ),
              );
              return;
            }

            if (timeController.startTime.value == null ||
                timeController.endTime.value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select both start and end time.'),
                ),
              );
              return;
            }

            final selectedDate = calendarController.selectedDay.value!
                .toString()
                .split(' ')
                .first;
            final startTime = timeController.startTime.value!.format(context);
            final endTime = timeController.endTime.value!.format(context);

          await  displayController.doctorsheduleadd(selectedDate, startTime, endTime);
        //   await displayController.scheduleAdd(selectedDate, startTime, endTime);

            calendarController.selectedDay.value = null;
            timeController.startTime.value = null;
            timeController.endTime.value = null;

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Time scheduled successfully.'),
              ),
            );
          },
          child: const Text("Schedule Time"),
        ),
      ),
    );
  }
}
