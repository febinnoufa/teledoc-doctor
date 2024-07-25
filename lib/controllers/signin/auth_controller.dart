// ignore_for_file: depend_on_referenced_packages

import 'package:deledocdoctor/views/screens/intro/intro_screem.dart';

import 'package:deledocdoctor/views/widgets/bottomNav/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();





   // Sign In
  //************************************************************************** */

  Future<void> signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );
      await _setLoginStatus(true);

      loginEmailController.clear();
      loginPasswordController.clear();
      Get.offAll(const BotomNavigationBar());
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }



  

   // Sign Out
  //************************************************************************** */

  Future<void> signOut() async {
      
    try {
      await auth.signOut();
      await _setLoginStatus(false);
      Get.offAll(IntroScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }





   // Set Login Status
  //************************************************************************** */

  Future<void> _setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
  }
}
