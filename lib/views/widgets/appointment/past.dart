import 'package:deledocdoctor/const/const.dart';
import 'package:deledocdoctor/controllers/appointments/appointment_controller.dart';
import 'package:deledocdoctor/models/appointment.dart';
import 'package:deledocdoctor/views/screens/prescription/showall_medicin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PastAppointments extends StatelessWidget {
  PastAppointments({super.key});

  final AppointmentController cntr = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Appointment>>(
        future: cntr.fetchAppointmentsPastForDoctor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No appointments found'));
          } else {
            final appointments = snapshot.data!
              ..sort((a, b) {
                DateTime dateA = DateTime.parse("${a.date} ${a.time}");
                DateTime dateB = DateTime.parse("${b.date} ${b.time}");
                return dateA.compareTo(dateB);
              });
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 20,
                    color: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //  crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              FadeInImage.assetNetwork(
                                placeholder:
                                    'https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg=', // Path to your placeholder image
                                image: appointment.image,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                        'https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg='), // Path to your placeholder image
                                  );
                                },
                                fit: BoxFit.cover,
                                width: 54, // Adjust size as needed
                                height: 54, // Adjust size as needed
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          appointment.patientName,
                                          //"Dr ${widget.doctorName}",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(appointment.reasonForAppointment),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cntr.appointmentId =
                                              appointment.appointmentId;
                                          //  Get.to(ChatScreen(id: appointment.userId,name: appointment.patientName,receiverPatient: appointment, ));
                                        },
                                        icon: const Icon(Icons.message))
                                  ],
                                ),
                              ),
                              // SizedBox(width: 100,),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 35,
                                width: 200,
                                child:  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(SHowAllDataInPrescription(id: appointment.appointmentId));
                                      },
                                  child: Text(
                                    "Show Prescription",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       color: Colors.black,
                              //       borderRadius: BorderRadius.circular(20)),
                              //   height: 35,
                              //   width: 100,
                              //   child: Center(
                              //       child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       const Icon(
                              //         Icons.timer,
                              //         color: Colors.white,
                              //         size: 17,
                              //       ),
                              //       const SizedBox(
                              //         width: 5,
                              //       ),
                              //       Text(
                              //         appointment.time,
                              //         style:
                              //             const TextStyle(color: Colors.white),
                              //       ),
                              //     ],
                              //   )),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
