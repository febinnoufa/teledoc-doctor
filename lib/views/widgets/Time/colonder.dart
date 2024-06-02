import 'package:deledocdoctor/controllers/time/colondercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ColenderWidget extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());

  ColenderWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Obx(
              () => Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TableCalendar(
                    calendarFormat: calendarController.calendarFormat.value,
                    focusedDay: calendarController.focusedDay.value,
                    firstDay: calendarController.firstDay,
                    lastDay: calendarController.lastDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(calendarController.selectedDay.value, day);
                    },
                    onFormatChanged: calendarController.onFormatChanged,
                    onDaySelected: calendarController.onDaySelected,
                  ),
                ),
              ),
            ),
            // /const SizedBox(height: 20),
            Obx(
              () => Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  height: 30,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      calendarController.selectedDay.value != null
                          ? 'Selected Date: ${calendarController.selectedDay.value.toString().split(' ').first}'
                          : 'No date selected',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
