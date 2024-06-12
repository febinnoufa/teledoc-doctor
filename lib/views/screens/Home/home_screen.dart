
import 'package:deledocdoctor/views/screens/Home/next_patiend.dart';
import 'package:deledocdoctor/views/widgets/home/all_appointments.dart';
import 'package:deledocdoctor/views/widgets/home/intro_desing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             HomeIntroDesgn(),
              NextPatientWidget(),
              AllAppointment(),
             //NextPatientWidget(),
        
             
            ],
          ),
        ),
      ),
    );
  }
}