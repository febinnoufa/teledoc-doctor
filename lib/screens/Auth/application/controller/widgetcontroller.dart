import 'package:get/get.dart';

class WidgetApplicationController extends GetxController {
 // var selectedGender = ''.obs;
   var selectspesialist = ''.obs;
  List<String> specialist = ['Cardiologist', 'Dermatologist', 'Neurologist', 'Pediatrician', 'Psychiatrist'];

  void selectspesialists(String value) {
    selectspesialist.value = value;
  }


    var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

}
