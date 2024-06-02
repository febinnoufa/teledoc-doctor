import 'package:deledocdoctor/controllers/time/model_doc.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorController extends GetxController {
  var doctor = DoctorModel(
    bio: '',
    email: '',
    experience: '',
    licensenumber: '',
    genter: '',
    name: '',
    phonenumber: 0,
    place: '',
    profile: '',
    //experiencecertificate: null,
    licenseimage: '',
    specialist: '',
    password: '',
  ).obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchDoctorDetails();
  }

  void fetchDoctorDetails() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot doc = await _db.collection('approveddoctors').doc(currentUser.uid).get();
        if (doc.exists) {
          doctor.value = DoctorModel.fromDocumentSnapshot(doc.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }


  // addSchedule(String date, String startTime, String endTime)async{
  //    User? currentUser = _auth.currentUser;
  //   _db.collection("approveddoctors").doc(currentUser!.uid).collection("schedules").add({
  //     'date':date,
  //     'startTime':startTime,
  //     'endTime':endTime,
  //     'createdAt':FieldValue.serverTimestamp(),
  //   });

  // }
}
