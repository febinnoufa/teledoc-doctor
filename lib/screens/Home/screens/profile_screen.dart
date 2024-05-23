// import 'package:deledocdoctor/screens/Home/servise/model_doc.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class DoctorDetailsPages extends StatefulWidget {
//   @override
//   _DoctorDetailsPageState createState() => _DoctorDetailsPageState();
// }

// class _DoctorDetailsPageState extends State<DoctorDetailsPages> {
//   DoctorModel? doctor;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchDoctorDetails();
//   }

//   Future<void> fetchDoctorDetails() async {
//     try {
//       User? currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser != null) {
//         DocumentSnapshot doc = await FirebaseFirestore.instance
//             .collection("approoveddoctors")
//             .doc(currentUser.uid)
//             .get();

//         if (doc.exists) {
//           setState(() {
//             doctor = DoctorModel.fromMap(doc);
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//           });
//         }
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Doctor Details"),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : doctor == null
//               ? Center(child: Text("No details found."))
//               : Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Name: ${doctor!.name ?? 'N/A'}"),
//                       Text("Email: ${doctor!.email ?? 'N/A'}"),
//                       Text("Phone Number: ${doctor!.phonenumber?.toString() ?? 'N/A'}"),
//                       Text("Place: ${doctor!.place ?? 'N/A'}"),
//                       Text("Profile: ${doctor!.profile ?? 'N/A'}"),
//                       Text("Gender: ${doctor!.gender ?? 'N/A'}"),
//                       Text("Specialist: ${doctor!.specialist ?? 'N/A'}"),
//                       Text("Bio: ${doctor!.bio ?? 'N/A'}"),
//                       Text("License Number: ${doctor!.licenseNumber ?? 'N/A'}"),
//                       Text("Experience: ${doctor!.experience ?? 'N/A'}"),
//                       // Add more fields as needed
//                     ],
//                   ),
//                 ),
//     );
//   }
// }
