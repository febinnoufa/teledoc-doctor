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
      print("Error fetching schedules: $e");
    }
  }

  // Future<List<ScheduleItem>> _getUserSchedules() async {
  //   User? currentUser = _auth.currentUser;
  //   if (currentUser != null) {
  //     QuerySnapshot querySnapshot = await _db
  //         .collection('schedule')
  //         .where('docId', isEqualTo: currentUser.uid)
  //         .orderBy('createdAt', descending: true)
  //         .get();

  //     List<ScheduleItem> schedules = querySnapshot.docs.map((doc) {
  //       return ScheduleItem.fromFirestore(doc);
  //     }).toList();

  //     return schedules;
  //   } else {
  //     throw Exception("No user is currently signed in.");
  //   }
  // }

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

  //  scheduleAdd(String date, String startTime, String endTime) async {
  //   User? currentUser = _auth.currentUser;
  //   if (currentUser != null)  {
  //     Map<String, bool> intervals =  splitTimeIntoIntervals(startTime, endTime);

  //     await _db.collection("schedule").doc().set({
  //       'date': date,
  //       'startTime': startTime,
  //       'endTime': endTime,
  //       'docId': currentUser.uid,
  //       'createdAt': FieldValue.serverTimestamp(),
  //       'intervals': intervals
  //     });

  //     await fetchUserSchedules();
  //   }
  // }

Map<String, bool> splitTimeIntoIntervals(String startTime, String endTime)  {
  // Define the date format
  final DateFormat timeFormat = DateFormat.Hm();
  
  // Parse the start and end times
  final DateTime start = timeFormat.parse(startTime);
  final DateTime end = timeFormat.parse(endTime);
  
  // Initialize an empty map to hold the intervals and their boolean values
  final Map<String, bool> intervals = {};

  // Initialize the current time to the start time
  DateTime currentTime = start;

  // Loop until the current time is less than the end time
  while (currentTime.isBefore(end)) {
    // Calculate the next interval time
    final DateTime nextTime = currentTime.add(const Duration(minutes: 30));

    // Create a key for the interval in the format HH:mm - HH:mm
    final String intervalKey = '${timeFormat.format(currentTime)} - ${timeFormat.format(nextTime)}';

    // Add the interval to the map with a default value of true
    intervals[intervalKey] = true;

    // Update the current time to the next interval time
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
          .doc()
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
