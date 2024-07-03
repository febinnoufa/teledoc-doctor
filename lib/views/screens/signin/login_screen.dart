import 'package:deledocdoctor/views/widgets/signin/login_form.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key});
 // final cntr =Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
        ),
        body:  ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20),
              child: LoginForm(),
            ),
            const Center(
                child: Text(
              "OR",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              "Contact Admin",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
            const SizedBox(height: 30,),
          
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Icon(Icons.email),
               SizedBox(width: 10,),
               Text("admin@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                
              ],
            ),

            const SizedBox(height: 50,),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Do you want to send application? "),
                TextButton(onPressed: (){
              //    Get.to(const SingUpScreen());
                }, child: const Text("send "))
              ],
            )
           

          ],
        ),
      ),
    );
  }
}
