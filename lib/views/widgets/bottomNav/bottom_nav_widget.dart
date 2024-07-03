import 'package:deledocdoctor/const/const.dart';
import 'package:deledocdoctor/views/screens/Home/home.dart';
import 'package:deledocdoctor/views/screens/Home/home_screen.dart';
import 'package:deledocdoctor/views/screens/appointment/myappointment.dart';
import 'package:deledocdoctor/views/screens/profile/profile_screen.dart';
import 'package:deledocdoctor/views/screens/Time/time_schedule_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BotomNavigationBar extends StatefulWidget {
  const BotomNavigationBar({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BotomNavigationBar> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              const HomeScreen(),
          
              const TimeSchedulingScreen(),
              const MyAppointment(),
             // DoctorHomeScreen(),
              DoctorDetailsPage(),
            ],
          ),
          bottomNavigationBar: WaterDropNavBar(
          //    backgroundColor: Colors.black,
            waterDropColor: greenColor,
               inactiveIconColor: Colors.black,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_filled,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                  filledIcon: Icons.local_hospital,
                  outlinedIcon: Icons.local_hospital_outlined),
              BarItem(
                filledIcon: Icons.notification_important,
                outlinedIcon: Icons.notification_important_outlined,
              ),
              BarItem(
                filledIcon: Icons.grid_view_rounded,
                outlinedIcon: Icons.grid_view_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
