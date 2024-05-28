import 'package:deledocdoctor/screens/Auth/application/controller/catogary_model.dart';
import 'package:deledocdoctor/screens/Auth/application/controller/widgetcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SpesilstSelectionScreen extends StatelessWidget {
  final WidgetApplicationController widgetController = Get.put(WidgetApplicationController());
  final WidgetApplicationController categoryController = Get.put(WidgetApplicationController());

  SpesilstSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() => Material(
            borderRadius: BorderRadius.circular(25),
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.contact_page_outlined),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      widgetController.selectspesialist.value.isNotEmpty
                          ? widgetController.selectspesialist.value
                          : 'Specialist',
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Obx(() => DropdownButton<String>(
                    value: widgetController.selectspesialist.value.isEmpty
                        ? null
                        : widgetController.selectspesialist.value,
                    items: categoryController.categories.map((Category category) {
                      return DropdownMenuItem<String>(
                        value: category.name,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        widgetController.selectspesialists(newValue);
                      }
                    },
                  )),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
