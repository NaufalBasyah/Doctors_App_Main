import 'package:flutter/material.dart';
import 'mysql.dart';
import 'roundedInputField.dart';
import 'roundedButton.dart';

class newPatientPage extends StatefulWidget {
  @override
  _newPatientPageState createState() => _newPatientPageState();
}

class _newPatientPageState extends State<newPatientPage> {
  String pickedTitle;
  List<String> titles=['Mr','Mrs','Ms'];
  String fname;
  String lname;
  DateTime dob;
  String pickedSex;
  List<String> sexes =['Male', 'Female','Pefer not to say','others'];
  @override
  void initState(){
    super.initState();
    pickedTitle= titles[0];
    pickedSex = sexes[0];
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
                      "New Patient",
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
                                  Text("Title   :  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black
                                      )
                                  ),
                                  DropdownButton<String>(
                                      value: pickedTitle,
                                      icon: const Icon (Icons.arrow_downward),
                                      iconSize: 18,
                                      elevation: 16,
                                      underline: Container(
                                        height: 2,
                                        color: Colors.blue[800],
                                      ),
                                      items: titles.map((String item){
                                        return DropdownMenuItem<String> (
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue){
                                        setState(() {
                                          pickedTitle = newValue;
                                        });

                                      })
                                ]
                            ),
                            SizedBox( height: size.height * 0.01),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget> [
                                  RoundedInputFieldMini(
                                    hintText: "First Name",
                                    onChanged: (value) {
                                      setState(() {
                                        fname = value;
                                      });
                                    },
                                  ),
                                  SizedBox(width: size.width*0.03)
                                  ,RoundedInputFieldMini(
                                    hintText: "Last Name",
                                    onChanged: (value) {
                                      setState(() {
                                        lname = value;
                                      });
                                    },
                                  ),
                                ]
                            ),
                            SizedBox( height: size.height * 0.01),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget> [
                                  Text("DOB      :  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black
                                      )
                                  ),
                                  Column(
                                      children: <Widget> [
                                        Text(dob == null ? 'No Date Set':"${dob.toLocal()}".split(' ')[0],),
                                        RaisedButton(
                                            child: Text('Pick a Date'),
                                            onPressed: () {
                                              showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1910),
                                                  lastDate: DateTime(DateTime.now().year)
                                              ).then((date){
                                                setState((){
                                                  dob = date;
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
                                children: <Widget> [
                                  Text("Sex     :  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black
                                      )
                                  ),
                                  DropdownButton<String>(
                                      value: pickedSex,
                                      icon: const Icon (Icons.arrow_downward),
                                      iconSize: 18,
                                      elevation: 16,
                                      underline: Container(
                                        height: 2,
                                        color: Colors.blue[800],
                                      ),
                                      items: sexes.map((String item){
                                        return DropdownMenuItem<String> (
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue){
                                        setState(() {
                                          pickedSex = newValue;
                                        });

                                      })
                                ]
                            ),
                          ]
                      )
                  ),

                  RoundedButton(
                    text: "Confirm",
                    press: () {
                      print(pickedTitle + " " + fname+ " " + lname+ " " + pickedSex+ " " + dob.toString());
                    },
                  ),
                ]
            )
        )
    );
  }
}
