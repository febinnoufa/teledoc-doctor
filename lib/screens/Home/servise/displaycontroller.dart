import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DisplayController extends GetxController {
  var schedules = <ScheduleItem>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  DisplayController() {
    fetchSchedules();
  }

  void fetchSchedules() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      _db.collection("approveddoctors")
          .doc(currentUser.uid)
          .collection("schedules")
          .orderBy('createdAt')
          .snapshots()
          .listen((snapshot) {
        schedules.value = snapshot.docs.map((doc) => ScheduleItem.fromFirestore(doc)).toList();
      });
    }
  }

  void addSchedule(String date, String startTime, String endTime) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _db.collection("approveddoctors")
          .doc(currentUser.uid)
          .collection("schedules")
          .add({
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  void removeSchedule(String scheduleId) async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _db.collection("approveddoctors")
          .doc(currentUser.uid)
          .collection("schedules")
          .doc(scheduleId)
          .delete();
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
    Map data = doc.data() as Map;
    return ScheduleItem(
      id: doc.id,
      date: data['date'] ?? '',
      startTime: data['startTime'] ?? '',
      endTime: data['endTime'] ?? '',
    );
  }
}
