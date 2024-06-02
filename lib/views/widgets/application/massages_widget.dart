import 'package:flutter/material.dart';

class ApplicationSendMassageWidget extends StatelessWidget {
  const ApplicationSendMassageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20,),
        Text("Thank you for submitting your Application!",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 50,),
          Text("Your application is currently being reviewed by",style: TextStyle(fontWeight: FontWeight.w400),),
        SizedBox(height: 20,),
          Text("our admin team  Please check your email within",style: TextStyle(fontWeight: FontWeight.w400),),
        SizedBox(height: 20,),
          Text("the next 24 hours for further instructions  Upon ",style: TextStyle(fontWeight: FontWeight.w400),),
        SizedBox(height: 20,),
          Text(" approval, you will receive a password to access",style: TextStyle(fontWeight: FontWeight.w400),),
        SizedBox(height: 20,),
          Text(" the application.",style: TextStyle(fontWeight: FontWeight.w400),)
      ],
    );
  }
}