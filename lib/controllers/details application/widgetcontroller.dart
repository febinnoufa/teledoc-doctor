// ignore_for_file: depend_on_referenced_packages

import 'package:deledocdoctor/models/catogary_model.dart';
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


   var selectspesialist = ''.obs;
 

  void selectspesialists(String value) {
    selectspesialist.value = value;
  }


    var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }


void fetchCategories() async {
    final  result = await db.collection('categories').get();
    final List<Category> fetchedCategories = result.docs.map((doc) {
      // ignore: unnecessary_cast
      return Category.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    categories.assignAll(fetchedCategories);
  }



}
