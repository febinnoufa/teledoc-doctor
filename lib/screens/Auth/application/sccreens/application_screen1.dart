import 'package:deledocdoctor/screens/Auth/application/widgets/application_forms.dart';
import 'package:flutter/material.dart';

class DoctorApplicationSendScreen extends StatelessWidget {
  const DoctorApplicationSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:Scaffold(
        backgroundColor: const Color.fromARGB(255, 194, 236, 195),
        appBar: AppBar(
          backgroundColor:  const Color.fromARGB(255, 194, 236, 195),elevation: 0,
          leading: const Icon(Icons.arrow_back,color: Colors.black,),
          title: const Text("DETAILS",style: TextStyle(color: Colors.black),),centerTitle: true,
        ),
        body:  Column(
          children: [
            ApplicationFormsWidget()
          ],
          
        ),
      ) );
  }
}