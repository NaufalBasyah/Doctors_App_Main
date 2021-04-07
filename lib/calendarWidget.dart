import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'constraint.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fW){
    return TextStyle(
      color:Color(0xff30384c),
      fontWeight: fW
    );

  }
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child:SingleChildScrollView(
          child: Column(
            children: <Widget> [
              SizedBox(height:size.height*0.015 ),
              Container(
                // height: size.height*0.58,
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                      weekdayStyle: dayStyle(FontWeight.normal),
                      weekendStyle: dayStyle(FontWeight.normal),
                      selectedColor: kPrimaryColor,
                      todayColor: kPrimaryLight
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                    weekendStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Color(0xff30384c),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Color(0xff30384c)
                    ),
                    rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Color(0xff30384c)
                    ),
                  ),
                  calendarController: _controller,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left:30),
                width: size.width,
                height: size.height*0.475,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight:  Radius.circular(45)),
                  color: Colors.blue[900],
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "Today",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(top:20),
                          child: Row(
                            children: <Widget> [
                              Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: Color(0xff00cf8d),
                                size: 30
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                width: size.width*0.8,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Text("eConsultation",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      )
                                    ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Description of the appointment here",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal
                                        )
                                      )
                                  ]
                                )
                              )
                            ]
                          )
                        )

                      ]
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}
