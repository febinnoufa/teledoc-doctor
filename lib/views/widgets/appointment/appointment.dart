import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Upcoming Appointments'),
      //   backgroundColor: Colors.green,
      // ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 20,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "bgfhg",
                          //"Dr ${widget.doctorName}",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //  // _formatDuration(_timeRemaining),
                        //   style: const TextStyle(
                        //     color: Colors.red,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("gny",
                                //widget.appointment['date'] ?? 'N/A',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("hgbe",
                                //widget.appointment['time'] ?? 'N/A',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        // SizedBox(
                        //   width: 35,
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text("Category"),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     Text("hyuhbn",
                        //         //widget.specialty,
                        //         style: TextStyle(fontWeight: FontWeight.bold))
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reason for Appointment"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "hi",
                              //    widget.appointment['reason_for_appointment'] ?? 'N/A',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // cntr.deleteAppointmentDetails(
                        //     //     widget.appointment['appoimnet_id'] ?? '');
                        //   },
                        //   style: ButtonStyle(
                        //     backgroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.red),
                        //     fixedSize: MaterialStateProperty.all<Size>(
                        //       const Size(
                        //           100, 20), // Adjust the width and height here
                        //     ),
                        //   ),
                        //   child: const Text("Cancel"),
                        // )
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
