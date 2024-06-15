// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DisplayController extends GetxController {
  var schedules = <ScheduleItem>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserSchedules();
  }

  Future<void> fetchUserSchedules() async {
    try {
      List<ScheduleItem> fetchedSchedules = await _getUserSchedules();
      schedules.assignAll(fetchedSchedules);
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching schedules: $e");
    }
  }

  Future<List<ScheduleItem>> _getUserSchedules() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      QuerySnapshot snapshot = await _db
          .collection("approveddoctors")
          .doc(currentUser.uid)
          .collection("shedules")
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ScheduleItem.fromFirestore(doc))
          .toList();
    } else {
      return [];
    }
  }

  Map<String, bool> splitTimeIntoIntervals(String startTime, String endTime) {
    final DateFormat inputTimeFormat = DateFormat('h:mm a');
    final DateFormat outputTimeFormat = DateFormat('h:mm a');

    final DateTime start = inputTimeFormat.parse(startTime);
    final DateTime end = inputTimeFormat.parse(endTime);

    final Map<String, bool> intervals = {};

    DateTime currentTime = start;

    while (currentTime.isBefore(end)) {
      final DateTime nextTime = currentTime.add(const Duration(minutes: 30));

      final String intervalKey = outputTimeFormat.format(currentTime);
      final time= int.parse(intervalKey.split(":").first)<10 ? "0$intervalKey" : intervalKey;

      intervals[time] = true;

      currentTime = nextTime;
    }

    return intervals;
  }

  doctorsheduleadd(String date, String startTime, String endTime) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      Map<String, bool> intervals = splitTimeIntoIntervals(startTime, endTime);

      await _db
          .collection("approveddoctors")
          .doc(currentUser.uid)
          .collection("shedules")
          .doc(date)
          .set({
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'docId': currentUser.uid,
        'intervals': intervals,
        'createdAt': FieldValue.serverTimestamp()
      });
      await fetchUserSchedules();
    }
  }

  void deleteSchedule(String scheduleId) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _db.collection("schedule").doc(scheduleId).delete();
      await fetchUserSchedules();
    }
  }

  void removeSchedule(String scheduleId) async {
    User? currentUser = _auth.currentUser;
    try {
      await _db
          .collection("approveddoctors")
          .doc(currentUser!.uid)
          .collection("shedules")
          .doc(scheduleId)
          .delete();
      await _db.collection("schedule").doc(scheduleId).delete();

      await fetchUserSchedules();
    } catch (e) {
      // ignore: avoid_print
      print("Error removing schedule: $e");
    }
  }
}

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

  factory ScheduleItem.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ScheduleItem(
      id: doc.id,
      date: data['date'] ?? '',
      startTime: data['startTime'] ?? '',
      endTime: data['endTime'] ?? '',
    );
  }
}
