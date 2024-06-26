
// ignore_for_file: depend_on_referenced_packages

import 'package:deledocdoctor/views/screens/signin/login_screen.dart';
import 'package:deledocdoctor/views/widgets/bottomNav/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
   

  Future<void> signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );

      loginEmailController.clear();
      loginPasswordController.clear();
      Get.to(const BotomNavigationBar());
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }


   Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.offAll(LoginScreen()); 
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
 


}
