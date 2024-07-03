class ScheduleItem {
  final String id;
  final String date;
  final String startTime;
  final String endTime;

  ScheduleItem({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory ScheduleItem.fromFirestore( doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ScheduleItem(
      id: doc.id,
      date: data['date'] ?? '',
      startTime: data['startTime'] ?? '',
      endTime: data['endTime'] ?? '',
    );
  }
}
