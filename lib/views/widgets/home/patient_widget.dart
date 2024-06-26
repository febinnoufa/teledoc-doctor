import 'package:deledocdoctor/const/const.dart';
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
                                    FadeInImage.assetNetwork(
                        placeholder: 'https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg=', // Path to your placeholder image
                        image: appointment.image,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return CircleAvatar(
                            radius: 27,
                            backgroundImage: NetworkImage('https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg='), // Path to your placeholder image
                          );
                        },
                        fit: BoxFit.cover,
                        width: 54, // Adjust size as needed
                        height: 54, // Adjust size as needed
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
                                color: greenColor,
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