import 'package:deledocdoctor/views/widgets/application/dropdoun_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/application/details_foms_widget.dart';

class ApplicatioDetailsScreen extends StatelessWidget {
  const ApplicatioDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: const Color.fromARGB(255, 194, 236, 195),
        appBar: AppBar(
          backgroundColor:  const Color.fromARGB(255, 194, 236, 195),elevation: 0,
          leading: const Icon(Icons.arrow_back,color: Colors.black,),
          title: const Text("DETAILS",style: TextStyle(color: Colors.black),),centerTitle: true,
        ),
        body:  ListView(
          children: [
            SpesilstSelectionScreen(),
             DeatalsFormWidget()
           // ApplicationFormsWidget()
          ],
          
        ),
      ) );
  }
}