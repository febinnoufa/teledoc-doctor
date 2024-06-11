import 'dart:io';

import 'package:deledocdoctor/views/screens/application/massage_screen.dart';
import 'package:deledocdoctor/controllers/application/application_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeatalsFormWidget extends StatelessWidget {
  DeatalsFormWidget({super.key});

  final ApplicationController applicationController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 20,
              child: TextFormField(
                controller: applicationController.biocontroller,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 0.0),
                  prefixIcon: const Icon(
                    Icons.account_box_rounded,
                    size: 20,
                  ),
                  hintText: 'Bio',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bio';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 20,
              child: TextFormField(
                controller: applicationController.licensecontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_box_rounded,
                    size: 20,
                  ),
                  hintText: 'License Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your license number';
                  }
                  if (!RegExp(r'^[A-Z]{2}-\d{4}-\d{4}$').hasMatch(value)) {
                    return 'Enter a valid license number (e.g., AB-1234-5678)';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 20,
              child: TextFormField(
                controller: applicationController.experianscontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_box_rounded,
                    size: 20,
                  ),
                  hintText: 'Experience (optional)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ADD CERTIFICATE (optional)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 104, 101, 101)),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 20,
                  child: Container(
                    height: 55,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        applicationController.experienceimage.value.isEmpty
                            ? const Text("ADD EXPERIENCE CERTIFICATE")
                            : const Text("ADDED EXPERIENCE CERTIFICATE"),
                        const SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            applicationController.getImage(
                                applicationController.experienceimage);
                          },
                          icon: const Icon(Icons.image),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ADD LICENSE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 104, 101, 101)),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 20,
                  child: Container(
                    height: 55,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        applicationController.licenseimage.value.isEmpty
                            ? const Text("ADD LICENSE CERTIFICATE")
                            : const Text("ADDED LICENSE CERTIFICATE"),
                        const SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            applicationController
                                .getImage(applicationController.licenseimage);
                          },
                          icon: const Icon(Icons.image),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50.0,
            child: SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool isFormValid = true;

                    // Check if license image is uploaded
                    if (applicationController.licenseimage.value.isEmpty) {
                      isFormValid = false;
                      Get.snackbar(
                          'Error', 'Please upload your license certificate',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    }

                    if (isFormValid) {
                      // Optional: Upload experience image if selected
                      if (applicationController
                          .experienceimage.value.isNotEmpty) {
                        File imageFile =
                            File(applicationController.experienceimage.value);
                        String? imageUrl =
                            await applicationController.uploadImage(imageFile);
                        if (imageUrl != null) {
                          applicationController.downloadexperianseUrl.value =
                              imageUrl;
                          print(
                              'Experience certificate uploaded successfully: $imageUrl');
                        } else {
                          print('Failed to upload experience certificate');
                        }
                      }

                      // Upload license image
                      File licenseFile =
                          File(applicationController.licenseimage.value);
                      String? licenseImageUrl =
                          await applicationController.uploadImage(licenseFile);
                      if (licenseImageUrl != null) {
                        applicationController.downloadlicenseUrl.value =
                            licenseImageUrl;
                        print(
                            'License certificate uploaded successfully: $licenseImageUrl');
                      } else {
                        print('Failed to upload license certificate');
                      }

                      await applicationController.sendapplication();

                      Get.offAll(const ApplicationSendMessageScreen());
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                      color: Colors.green, // Change border color here
                      width: 3.0, // Change border thickness here
                    ),
                  ),
                  minimumSize: const Size(100, 0), // Set minimum button size
                ),
                child: const Text("SEND"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
