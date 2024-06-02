import 'package:deledocdoctor/views/screens/application/application_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendApplicasionWidget extends StatelessWidget {
  const SendApplicasionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              width: 270,
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 74, 143, 151),
                borderRadius:
                    BorderRadius.circular(20), // Adjust the radius as needed
                border: Border.all(
                  color:
                      const Color.fromARGB(255, 64, 217, 100), // Border color
                  width: 10.0, // Border thickness
                ),
              ),
              child: Image.asset("assets/illustration.png")),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50.0,
            child: SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(DoctorApplicationSendScreen());
                  // controller.adduser();
                  // controller.firstnamecontroller.clear();
                  // controller.lastnamecontroller.clear();
                  // controller.emailcontroller.clear();
                  // controller.passwordcontroller.clear();
                  // controller.agecontroller.clear();
                  // controller.placecontroller.clear();
                  // controller.addresscontroller.clear();
                  // controller.phonecontroller.clear();

                  //  Get.off(UserProfileScreen());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                      color: Colors.green, // Change border color here
                      width: 3.0, // Change border thickness here
                    ),
                  ),
                  minimumSize: const Size(100, 0), // Set minimum button size
                ),
                child: const Text("SEND APPLICATION"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
