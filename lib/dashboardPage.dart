import 'package:doctor_app/newAppointmentPage.dart';
import 'package:flutter/material.dart';
import 'roundedButton.dart';
import 'editProfilePage.dart';
import 'mysql.dart';

class dashboardPage extends StatefulWidget {
  @override
  _dashboardPageState createState() => _dashboardPageState();
}

class _dashboardPageState extends State<dashboardPage> {
  var db = new Mysql();
  var eventList = [];
  var namesList = [];
  var todaysEventList = [];
  String now = DateTime.now().toString().substring(0,10);
  String notNow = DateTime.utc(2021,DateTime.march, 18).toString().substring(0,10);
  void getEvents(){
    db.getConnection().then((conn) {
      String sql = "select pc_pid, pc_title, pc_eventDate, pc_startTime, pc_endTime from openemr_postcalendar_events;";
      conn.query(sql).then((results){
        for (var row in results){
          setState(() {
              eventList.add(row);
          });
        }
        fillDates();
      });
    });
  }
  void getNames(){
    db.getConnection().then((conn) {
      String sql = "select id, fname, lname from patient_data where id='${todaysEventList[0].toString()}';";
      conn.query(sql).then((results){
        for (var row in results){
          setState(() {
            namesList.add(row[1]+" "+row[2]);
          });
        }
      });
    });
    print(namesList);
  }
  void fillDates() {
    getNames();
    for (var row in eventList) {
      if (row[2].toString().substring(0, 10) == notNow) {
        print(row[0].toString());
        print(row[1].toString());
        print(row[2].toString().substring(0, 10));
        print(row[3].toString().substring(0, 5));
        print(row[4].toString().substring(0, 5));
        setState(() {
          todaysEventList.add(row);
        });
      } else if (eventList.isEmpty) {
        print("no shit here sir");
      } else {
        print("yeah no");
      }
    }
    setState(() {
      eventList = [];
    });
    print(now);
  }
  DataTable createTodaySchedule(){
    return DataTable(
      columns: [
        DataColumn(
            label:Text("Start"),
            numeric: false,
            tooltip: "Start Time"
        ),
        DataColumn(
            label:Text("End"),
            numeric: false,
            tooltip: "End Time"
        ),
        DataColumn(
            label:Text("PID"),
            numeric: false,
            tooltip: "Patient ID"
        ),
        DataColumn(
            label:Text("Type"),
            numeric: false,
            tooltip: "Type of visit"
        )
      ],
      rows: todaysEventList.map(
              (user) => DataRow(
              cells: [
                DataCell(
                  Text(user[3].toString().substring(0, 5)),
                  onTap: (){

                  },
                ),
                DataCell(
                    Text(user[4].toString().substring(0, 5))
                ),
                DataCell(
                    Text(user[0].toString())
                ),
                DataCell(
                    Text(user[1].toString())
                ),
              ]
          )
      ).toList(),
    );
  }
  @override
  void initState(){
    super.initState();
    getEvents();
    fillDates();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Container(
                      height: size.height*0.24,
                      child:Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Row(
                              children: <Widget> [
                                CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage('https://www.scripps.org/sparkle-assets/images/headshot-kim-hui-b5afaebeec2a6d7c4887266d94fb6c0e.jpg'),
                                ),
                                SizedBox(width: size.width*0.05),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget> [
                                      Text(
                                          'Dr. Barbara Lang',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      SizedBox(height: size.height*0.005),
                                      RoundedButtonMini(
                                        text: "Edit My Profile",
                                        press: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (context){
                                                return EditProfile();
                                              }
                                          )
                                          );
                                        },
                                      )
                                    ]
                                )
                              ]
                          )
                      )
                  ),
                  RoundedButton(
                    text: "Make New Appointment",
                    press: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context){
                            return newAppointmentPage();
                          }
                      )
                      );

                    },
                  ),
                  Container(
                      height: size.height*0.38,
                      alignment: Alignment.topLeft,
                      child:Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height:size.height*0.01),
                                Text(
                                    "Today's Schedule",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                Container(
                                  height: size.height*0.24,
                                  child: SingleChildScrollView(
                                    child: createTodaySchedule()
                                  )
                                )
                              ]
                          )
                      )
                  ),
                  Container(
                      height: size.height*0.18,
                      child:Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Text("Filler Box",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                SingleChildScrollView(
                                  child:  Card(
                                    child: ListTile(
                                      leading: FlutterLogo(size: 28.0),
                                      title: Text('This is Just a Filler'),
                                      subtitle: Text('This is Just a Filler This is Just a Filler This is Just a Filler '),
                                      // trailing: Icon(Icons.beenhere_outlined),
                                    ),
                                  ),
                                ),



                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}




