import 'package:deledocdoctor/screens/Home/widgets/imagepreview.dart';
import 'package:deledocdoctor/servises/doc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsPage extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dr. ${doctorController.doctor.value.name}',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (doctorController.doctor.value.email.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.network(doctorController.doctor.value.profile),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Dr. ${doctorController.doctor.value.name}',
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  doctorController.doctor.value.specialist,
                  style: const TextStyle(color: Colors.green),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "About ${doctorController.doctor.value.name}",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  doctorController.doctor.value.bio,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Email: ${doctorController.doctor.value.email}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Experience: ${doctorController.doctor.value.experience}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Gender: ${doctorController.doctor.value.genter}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Place: ${doctorController.doctor.value.place}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Phone No: ${doctorController.doctor.value.phonenumber}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [ 
                    const SizedBox(
                      width: 80,
                    ),
                    TextButton(onPressed: () {
                      Get.to(ImagePreviewWidget(image: doctorController.doctor.value.licenseimage,));
                    }, child: const Text("License")),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(onPressed: () {}, child: const Text("expereance"))
                  ],
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
