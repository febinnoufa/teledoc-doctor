import 'package:deledocdoctor/views/widgets/application/image_widget.dart';
import 'package:deledocdoctor/views/widgets/application/massages_widget.dart';
import 'package:deledocdoctor/views/screens/intro/intro_screem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationSendMessageScreen extends StatelessWidget {
  const ApplicationSendMessageScreen({super.key});

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
        body:   Column(
          children: [
            const ApplicationSendMassageImageWidgwt(),
           const ApplicationSendMassageWidget(),


           const SizedBox(height: 60,),

                 SizedBox(
            height: 50.0,
            child: SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(const IntroScreen());
              
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                      color: Colors.green, 
                      width: 3.0, 
                    ),
                  ),
                  minimumSize: const Size(100, 0), 
                ),
                child: const Text("SEND"),
              ),
            ),
          ),
          ],
          
        ),
      ) );
  }
}