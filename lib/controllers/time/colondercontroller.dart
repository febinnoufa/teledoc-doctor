import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  var calendarFormat = CalendarFormat.month.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = Rx<DateTime?>(null);
  var firstDay = DateTime.now();
  var lastDay = DateTime.now().add(const Duration(days: 365));

  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }





   // Selected date
  //************************************************************************** */

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.selectedDay.value, selectedDay)) {
      this.selectedDay.value = selectedDay;
      this.focusedDay.value = focusedDay;
    }
  }
}
