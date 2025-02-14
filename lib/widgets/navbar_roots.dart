import 'package:cs_project_2/model/user_model.dart';
import 'package:cs_project_2/screen/home_page.dart';

import 'package:cs_project_2/screen/schedule_screen.dart';
import 'package:cs_project_2/screen/settings_screens.dart';
import 'package:flutter/material.dart';

class NavbarRoots extends StatefulWidget {
  const NavbarRoots( {super.key,  this.details});
  final Users? details;
  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
  
  int selectedIndex = 0;
  final screens =
   [
    HomePage( ),
   ScheduleScreen(),  
    SettingsScreens() 
  ];

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
           
            
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Sattings',
            ),
            
          ],
          
        ),
      ),
    );
  }
}
