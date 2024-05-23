import 'package:deledocdoctor/screens/choice_screen/screens/intro_screem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
     Get.off(() => const IntroScreen()); 
    });

    return  Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: Image.asset("assets/TELE DOC(1).png")
      ),
    );
  }
}
