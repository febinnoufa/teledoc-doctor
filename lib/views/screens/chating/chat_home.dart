import 'package:deledocdoctor/views/widgets/chating/all_users.dart';
import 'package:flutter/material.dart';

class ChatingHomeScreen extends StatelessWidget {
  const ChatingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Message",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20,child: Container(color:Colors.white,),),
            SizedBox(height: 10,child: Container(color: const Color.fromARGB(255, 190, 186, 186),),),
            Expanded(child: ChatingAllUsers())
          ],

        ),
      ),
    );
  }
}