import 'package:flutter/material.dart';

class ApplicationSendMassageImageWidgwt extends StatelessWidget {
  const ApplicationSendMassageImageWidgwt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 100,),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage:AssetImage("assets/illustration.png"),
            radius: 100,
          ),
        )
      ],
    );
  }
}