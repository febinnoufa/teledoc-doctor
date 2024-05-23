import 'package:deledocdoctor/screens/Auth/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            
  width: 270,
  height: 250,
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 74, 143, 151),
    borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
    border: Border.all(
    color: const Color.fromARGB(255, 64, 217, 100), // Border color
    width: 10.0, // Border thickness
    ),
  ),
  child:Image.asset("assets/undraw_Doctors_p6aq 1.png")
),
const SizedBox(height: 30,)
,
           SizedBox(
          height: 50.0,
          child: SizedBox(
            width: 250.0,
            child: ElevatedButton(
              onPressed: () {
                Get.off(LoginScreen());
               
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
              child: const Text("LOGIN"),
            ),
          ),
        ),
          
        ],
      ),
    );
  }
}