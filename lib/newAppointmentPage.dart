import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'roundedButton.dart';
import 'mysql.dart';
import 'package:intl/intl.dart';

class newAppointmentPage extends StatefulWidget {
  @override
  _newAppointmentPageState createState() => _newAppointmentPageState();
}

class _newAppointmentPageState extends State<newAppointmentPage> {
  var db = new Mysql();
  String pickedPatient ;
  List<String> patientNames = List<String>();
  void getNames(){
    db.getConnection().then((conn) {
      String sql = 'select fname, lname from patient_data;';
      conn.query(sql).then((results){
        for (var row in results){
          setState(() {
            patientNames.add(row[0]+' '+row[1]);
            pickedPatient= patientNames[0];
            pickedDuration = durationOption[0];
          });
        }
      });
    });
  }
  DateTime _dateTime;
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;

  Future<Null> selectTime(BuildContext context) async{
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    setState((){
      _time = picked;
    });
  }

  List<int> durationOption = [15, 30, 45, 60];
  int pickedDuration;
  List<bool> isSelected;
  String appType;
  @override
  void initState(){
    super.initState();
    getNames();
    isSelected = [true, false];
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
                      Text(
                            "New Appointment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black
                            )
                        ),
                  SizedBox( height: size.height * 0.008),
                  Container(
                    height: size.height*0.38,
                      padding: const EdgeInsets.fromLTRB(45.0,0,0,0),
                    alignment: Alignment.center,
                    child:Column(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget> [
                                Text("Patient :  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black
                                    )
                                ),
                                DropdownButton<String>(
                                    value: pickedPatient,
                                    icon: const Icon (Icons.arrow_downward),
                                    iconSize: 18,
                                    elevation: 16,
                                    underline: Container(
                                      height: 2,
                                      color: Colors.blue[800],
                                    ),
                                    items: patientNames.map((String item){
                                      return DropdownMenuItem<String> (
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String newValue){
                                      setState(() {
                                        pickedPatient = newValue;
                                      });

                                    })
                              ]
                          ),
                          SizedBox( height: size.height * 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Text("Date     :  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black
                                    )
                                ),
                                Column(
                                    children: <Widget> [
                                      Text(_dateTime == null ? 'No Date Set':"${_dateTime.toLocal()}".split(' ')[0],),
                                      RaisedButton(
                                          child: Text('Pick a Date'),
                                          onPressed: () {
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2021),
                                                lastDate: DateTime(2023)
                                            ).then((date){
                                              setState((){
                                                DateTime temp = new DateTime(date.year,date.month,date.day);
                                                _dateTime = temp;
                                              });
                                            });
                                          }
                                      )
                                    ]
                                )
                              ]
                          ),
                          SizedBox( height: size.height * 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Text("Time    :  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black
                                    )
                                ),
                                Column(
                                    children: <Widget> [
                                      Text(_dateTime == null ? 'No Time Set':_time.format(context).toString()),
                                      RaisedButton(
                                          child: Text('Pick a Start Time'),
                                          onPressed: () {
                                            selectTime(context);
                                          }
                                      )
                                    ]
                                )
                              ]
                          ),
                          SizedBox( height: size.height * 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget> [
                                Text("Duration:  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black
                                    )
                                ),
                                DropdownButton<int>(
                                    value: pickedDuration,
                                    icon: const Icon (Icons.arrow_downward),
                                    iconSize: 18,
                                    elevation: 16,
                                    underline: Container(
                                      height: 2,
                                      color: Colors.blue[800],
                                    ),
                                    items: durationOption.map((int item){
                                      return DropdownMenuItem<int> (
                                        value: item,
                                        child: Text(item.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (int newValue){
                                      setState(() {
                                        pickedDuration = newValue;
                                      });

                                    }),
                                Text (" Minutes")
                              ]
                          ),
                        ]
                    )
                  ),
                  SizedBox( height: size.height * 0.01),
            ToggleButtons(
              borderColor: Colors.black,
              fillColor: Colors.blue[800],
              borderWidth: 2,
              selectedBorderColor: Colors.black,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(30),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'eConsulting',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'OutPatient',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                    if (isSelected[0] == true){
                      appType = "eConsulting";
                    }else{
                      appType = "OutPatient";
                    }
                    // print(appType);
                  }
                });
              },
              isSelected: isSelected,
            ),
                  SizedBox( height: size.height * 0.01),

                  RoundedButton(
                    text: "Confirm",
                    press: () {
                      print(pickedPatient+" "+_dateTime.toString()+" "+_time.format(context).toString()+" "+pickedDuration.toString()+" "+appType);
                    },
                  ),
                ]
            )
        )
    );
  }
}



