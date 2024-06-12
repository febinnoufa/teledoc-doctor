import 'package:deledocdoctor/const/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PatientWidget extends StatelessWidget {
   PatientWidget({super.key , this.appointments, this.name});
  final appointments;
  final name;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: appointments.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final appointment = appointments[index];
                      return Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 27,
                                      backgroundImage: NetworkImage(appointment.image), // Replace with actual image
                                    ),
                                    const SizedBox(height: 11),
                                    Text(
                                      appointment.patientName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 190,
                              decoration: BoxDecoration(
                                color: greenColor, // Replace with your actual color
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.timer, size: 20,),
                                  const SizedBox(width: 5,),
                                  Text(
                                    appointment.time,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
  }
}