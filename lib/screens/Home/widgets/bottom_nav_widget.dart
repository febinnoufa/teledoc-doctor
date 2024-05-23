import 'package:deledocdoctor/screens/Home/screens/home.dart';
import 'package:deledocdoctor/screens/Home/screens/profile_screen.dart';
import 'package:deledocdoctor/screens/Home/widgets/profile_photo.dart';
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
              DoctorHomeScreen(),
              Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.favorite_rounded,
                  size: 56,
                  color: Color.fromARGB(255, 35, 10, 10),
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite_rounded,
                  size: 56,
                  color: Colors.red[400],
                ),
              ),
              //    Container(
              //   alignment: Alignment.center,
              //   child: Icon(
              //     Icons.email_rounded,
              //     size: 56,
              //     color: Colors.green[400],
              //   ),
              // ),
              // Container(
              //   alignment: Alignment.center,
              //   child: Icon(
              //     Icons.email_rounded,
              //     size: 56,
              //     color: Colors.green[400],
              //   ),
              // ),
              DoctorDetailsScreen()
            ],
          ),
          bottomNavigationBar: WaterDropNavBar(
            backgroundColor: navigationBarColor,
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
