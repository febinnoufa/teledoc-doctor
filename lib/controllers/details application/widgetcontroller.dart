import 'package:deledocdoctor/controllers/details%20application/catogary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class WidgetApplicationController extends GetxController {
   final FirebaseFirestore db = FirebaseFirestore.instance;
  final RxList<Category> categories = RxList<Category>([]);


   @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

 // var selectedGender = ''.obs;
   var selectspesialist = ''.obs;
 // List<String> specialist = ['Cardiologist', 'Dermatologist', 'Neurologist', 'Pediatrician', 'Psychiatrist'];

  void selectspesialists(String value) {
    selectspesialist.value = value;
  }


    var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }



  // (assuming a method to fetch data from Firestore)
void fetchCategories() async {
    final  result = await db.collection('categories').get();
    final List<Category> fetchedCategories = result.docs.map((doc) {
      return Category.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    categories.assignAll(fetchedCategories);
  }



}
