import 'package:deledocdoctor/screens/Home/servise/model_doc.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorController extends GetxController {
  var doctorModel = DoctorModel(
    bio: '',
    email: '',
    experience: '',
    licensenumber: '',
    gender: '',
    name: '',
    phonenumber: '',
    place: '',
    profile: '',
    experiencecertificate: null,
    licenseimage: '',
    specialist: '',
    password: '',
  ).obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("shgfduytfgrweeytwey,,,,,,,,,,,,,,,,,");
    fetchDoctorDetails();
  }

  void fetchDoctorDetails() async {
    try {
      isLoading(true);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('approveddoctors')
            .doc(user.uid)
            .get();
      
        if (doc.exists) {
          doctorModel.value = DoctorModel.fromDocumentSnapshot(doc);
        }
      }
    } catch (e) {
      print("Error fetching doctor details: $e");
    } finally {
      isLoading(false);
    }
  }
}
