import 'package:deledocdoctor/const/const.dart';
import 'package:deledocdoctor/controllers/doctor/doc_controller.dart';
import 'package:deledocdoctor/views/screens/chating/chat_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeIntroDesgn extends StatelessWidget {
  HomeIntroDesgn({super.key});
  final DoctorController doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, 
      width: double.infinity,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage(doctorController.doctor.value.profile),
                ),
                const Text(
                  "TELE DOC",
                  style: TextStyle(
                    fontFamily: 'YourFontFamily',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ChatingHomeScreen());
                  },
                  child: const Icon(Icons.message))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Welcome ${doctorController.doctor.value.name}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Have a Nice day ",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 30,
            ),
            // Search Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey[400]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
