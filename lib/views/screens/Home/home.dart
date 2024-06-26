import 'package:deledocdoctor/controllers/signin/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});
  final AuthController cntr = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              cntr.signOut();
            },
            icon: const Icon(Icons.logout)),
      ),
    ));
  }
}
