import 'package:deledocdoctor/const/const.dart';
import 'package:deledocdoctor/views/widgets/appointment/appointment.dart';
import 'package:flutter/material.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text("Appointment",style: TextStyle(color: Colors.black),),
          ),
          body: Column(
            children: [
             const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                     color: Colors.black,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  // Set the background color if needed
                  child:  TabBar(
                    
                    dividerColor: greenColor,
                    indicatorColor: greenColor,
                    unselectedLabelColor: Colors.white,
                    labelColor: greenColor,
                    tabs: [
                      const Tab(text: 'Upcoming'),
                      const Tab(text: 'Past'),
                     // Tab(text: 'Cancelled'),
                    ],
                  ),
                ),
              ),
               Expanded(
                child: TabBarView(
                  children: [
                    UpcomingAppointment(),
                  //  Center(child: Text('Upcoming Appointments')),
                    Center(child: Text('Past Appointments')),
                //    Center(child: Text('Cancelled Appointments')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
