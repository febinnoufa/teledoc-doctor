import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deledocdoctor/controllers/details%20application/widgetcontroller.dart';
import 'package:deledocdoctor/controllers/application/application_controller.dart';
import 'package:deledocdoctor/views/screens/application/details_screen.dart';

class ApplicationFormsWidget extends StatelessWidget {
  final WidgetApplicationController genderController =
      Get.put(WidgetApplicationController());
  final ApplicationController applicationController = Get.find();

  ApplicationFormsWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      applicationController
                          .getImage(applicationController.imageTemporary);
                    },
                    child: Obx(
                      () => CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.black,
                        backgroundImage:
                            applicationController.imageTemporary.value.isNotEmpty
                                ? FileImage(File(applicationController.imageTemporary.value))
                                : const AssetImage('assets/profile.png') as ImageProvider,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "PROFILE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: applicationController.namecontroller,
                    hintText: 'Name',
                    icon: Icons.account_box_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: applicationController.placecontroller,
                    hintText: 'Place',
                    icon: Icons.account_box_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your place';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: applicationController.emailcontroller,
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: applicationController.phonenumbercontroller,
                    hintText: 'Phone Number',
                    icon: Icons.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("GENDER",
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _buildGenderOption('Male'),
                            const SizedBox(width: 20),
                            _buildGenderOption('Female'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (applicationController.imageTemporary.value.isNotEmpty) {
                            File imageFile =
                                File(applicationController.imageTemporary.value);
                            String? imageUrl =
                                await applicationController.uploadImage(imageFile);

                            if (imageUrl != null) {
                              applicationController.downloadUrl.value = imageUrl;
                              print(
                                  'Image uploaded successfully: $imageUrl');
                            } else {
                              print('Failed to upload image');
                              // Handle the error case here if needed
                            }
                          } else {
                            print('No image selected');
                            // Handle the case where no image is selected
                          }

                          if (genderController.selectedGender.value.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Selected gender: ${genderController.selectedGender.value}'),
                              ),
                            );
                            Get.off(const ApplicatioDetailsScreen());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please select a gender')),
                            );
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
                        minimumSize: const Size(250, 50), // Set minimum button size
                      ),
                      child: const Text("NEXT"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 10,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 20),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return Row(
      children: [
        Text(gender),
        Obx(() => Radio<String>(
              value: gender,
              groupValue: genderController.selectedGender.value,
              onChanged: (String? value) {
                genderController.selectGender(value!);
              },
            )),
      ],
    );
  }
}
