import 'package:doctor_app/dashboardPage.dart';
import 'package:doctor_app/mysqlTryPage.dart';
import 'package:flutter/material.dart';
import 'dashboardPage.dart';
import 'calendarWidget.dart';
import 'patientListPage.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int _currentIndex = 0;

  final List<Widget> tabs = [
    dashboardPage(),
    CalendarPage(),
    patientListPage(),
    // mysqlTryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue[800],
        // iconSize: 13,
        // selectedFontSize: 13,
        // unselectedFontSize: 0,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal_rounded),
            label: "Patients",
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
