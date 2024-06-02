import 'package:deledocdoctor/controllers/signin/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "EMAIL",
              style: TextStyle(fontSize: 13),
            ),
          ),
          TextFormField(
            controller: authController.loginEmailController,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              prefixIcon: const Icon(Icons.email, size: 20),
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: authController.loginPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye),
              ),
              prefixIcon: const Icon(Icons.lock, size: 20),
              hintText: 'Enter your password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 40),
          SizedBox(
            height: 50.0,
            child: SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: () async {
                  await authController.signIn();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                      color: Colors.green,
                      width: 3.0,
                    ),
                  ),
                  minimumSize: const Size(100, 0),
                ),
                child: const Text("Login"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
