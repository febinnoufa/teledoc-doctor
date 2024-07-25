import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deledocdoctor/controllers/details%20application/widgetcontroller.dart';
import 'package:deledocdoctor/models/application.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_storage/firebase_storage.dart'; // Ensure this import is present
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class ApplicationController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  TextEditingController licensecontroller = TextEditingController();
  TextEditingController experianscontroller = TextEditingController();

  final WidgetApplicationController genderController =
      Get.put(WidgetApplicationController());
  var imageTemporary = "".obs;
  var experienceimage = "".obs;
  var licenseimage = "".obs;
  var downloadUrl = "".obs;
  var downloadexperianseUrl = "".obs;
  var downloadlicenseUrl = "".obs;
  var loading = false.obs;






   // Get Image
  //************************************************************************** */

  Future<void> getImage(image) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    image.value = pickedImage.path;
  }




   // upload Image
  //************************************************************************** */

  Future<String?> uploadImage(File image) async {
    try {
      loading.value = true;
      String fileName = basename(image.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      loading.value = false;

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  FirebaseFirestore db = FirebaseFirestore.instance;





   // Send Application
  //************************************************************************** */

  sendapplication() async {
    DoctorApplicationModel application = DoctorApplicationModel(
      bio: biocontroller.text.trim(),
      email: emailcontroller.text.trim(),
      experience: experianscontroller.text.trim(),
      licensenumber: licensecontroller.text.trim(),
      genter: genderController.selectedGender.value,
      name: namecontroller.text.trim(),
      phonenumber: int.parse(phonenumbercontroller.text.trim()),
      place: placecontroller.text.trim(),
      profile: downloadUrl.value,
      experiencecirtificate: downloadexperianseUrl.value,
      licenseimage: downloadlicenseUrl.value,
      specialist: genderController.selectspesialist.value,
      password: null,
    );
    await db.collection("doctors").doc().set(application.toMap());
    biocontroller.clear();
    emailcontroller.clear();
    experianscontroller.clear();
    licensecontroller.clear();
    namecontroller.clear();
    phonenumbercontroller.clear();
    placecontroller.clear();
    licenseimage = "".obs;
    experienceimage = "".obs;
    imageTemporary = "".obs;
  }
}
