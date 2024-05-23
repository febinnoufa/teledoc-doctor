import 'package:deledocdoctor/screens/Auth/application/controller/widgetcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SpesilstSelectionScreen extends StatelessWidget {
  final WidgetApplicationController cntrl = Get.put(WidgetApplicationController());

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
                      Icon(Icons.contact_page_outlined),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Text(
                          // cntrl.selectspesialist.value.isNotEmpty
                          //     ? cntrl.selectspesialist.value
                          //     : 
                              ' Specialist',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DropdownButton<String>(
                        value: cntrl.selectspesialist.value.isEmpty
                            ? null
                            : cntrl.selectspesialist.value,
                       // hint: Text('Specialist'),
                        items: cntrl.specialist.map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            
                            child: Text(val),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            cntrl.selectspesialists(newValue);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
         
            ],
          ),
        );
  }
}
