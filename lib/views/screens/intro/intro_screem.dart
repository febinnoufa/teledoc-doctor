

import 'package:deledocdoctor/views/widgets/intro/application_widget.dart';
import 'package:deledocdoctor/views/widgets/intro/loginopsion.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(255, 187, 243, 188),
      body: Column(
        children: [
          SendApplicasionWidget(),
          LoginOptionWidget()

        ],
      ),
    ));
  }
}