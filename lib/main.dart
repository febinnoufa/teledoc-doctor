import 'package:deledocdoctor/firebase_options.dart';
import 'package:deledocdoctor/controllers/application/application_controller.dart';
import 'package:deledocdoctor/views/screens/splash_screen/splash.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: BindingsBuilder(() {
          Get.put(ApplicationController());
        }),
        home: const SplashPage());
  }
}
