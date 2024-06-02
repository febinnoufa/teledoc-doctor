import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

  Future<List<ScheduleItem>> _getUserSchedules() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      QuerySnapshot querySnapshot = await _db
          .collection('schedule')
          .where('docId', isEqualTo: currentUser.uid)
          .orderBy('createdAt', descending: true)
          .get();

      List<ScheduleItem> schedules = querySnapshot.docs.map((doc) {
        return ScheduleItem.fromFirestore(doc);
      }).toList();

      return schedules;
    } else {
      throw Exception("No user is currently signed in.");
    }
  }

  void scheduleAdd(String date, String startTime, String endTime) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _db.collection("schedule").doc().set({
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'docId': currentUser.uid,
        'createdAt': FieldValue.serverTimestamp()
      });
      await fetchUserSchedules(); // Refresh the schedule list after adding a new schedule
    }
  }

  void removeSchedule(String scheduleId) async {
    try {
      await _db.collection("schedule").doc(scheduleId).delete();
      await fetchUserSchedules(); // Refresh the schedule list after deleting a schedule
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
