import 'package:deledocdoctor/controllers/appointments/appointment_controller.dart';
import 'package:deledocdoctor/models/appointment.dart';
import 'package:deledocdoctor/views/widgets/home/patient_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class NextPatientWidget extends StatelessWidget {
  NextPatientWidget({super.key});
  final AppointmentController cntr = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Next Patient",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 160, 
            child: FutureBuilder<List<Appointment>>(
              future: cntr.fetchAppointmentsForDoctor(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No appointments found'));
                } else {
                  final appointments = snapshot.data!..sort((a, b) {
                    DateTime dateA = DateTime.parse("${a.date} ${a.time}");
                    DateTime dateB = DateTime.parse("${b.date} ${b.time}");
                    return dateA.compareTo(dateB);
                  });
                  return PatientWidget(appointments: appointments,);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
