import 'package:deledocdoctor/views/screens/intro/intro_screem.dart';
import 'package:deledocdoctor/views/widgets/bottomNav/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn) {
        Get.off(() => const BotomNavigationBar());
      } else {
        Get.off(() => IntroScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const IntroScreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/TELE DOC(1).png")),
    );
  }
}
