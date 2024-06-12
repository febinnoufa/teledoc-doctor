import 'package:deledocdoctor/models/appointment.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentController extends GetxController {
  Future<List<Appointment>> fetchAppointmentsForDoctor() async {
  try {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('docter', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) => Appointment.fromFirestore(doc)).toList();
  } catch (e) {
    print('Error fetching appointments: $e');
    return [];
  }
}

  
}