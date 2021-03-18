import 'package:flutter/material.dart';
import 'dummy_users.dart';
import 'roundedButton.dart';


class patientListPage extends StatefulWidget {
  @override
  _patientListPageState createState() => _patientListPageState();
}

class _patientListPageState extends State<patientListPage> {
  List<User> users;
  @override
  void initState(){
    users = User.getUsers();
    super.initState();
  }
  DataTable patientDataTable(){
    return DataTable(
      columns: [
        DataColumn(
            label:Text("PID"),
            numeric: false,
            tooltip: "Patient ID"
        ),
        DataColumn(
            label:Text("Patient"),
            numeric: false,
            tooltip: "Patient Full Name"
        ),
        DataColumn(
            label:Text("Contact"),
            numeric: false,
            tooltip: "Patient Phone Number"
        )
      ],
      rows: users.map(
              (user) => DataRow(
                cells: [
                  DataCell(
                    Text(user.pID)
                  ),
                  DataCell(
                      Text(user.fullName)
                  ),
                  DataCell(
                      Text(user.phoneNum)
                  ),
                ]
              )
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget> [
                    Text(
                      "Patients List",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      )
                    ),
                    patientDataTable(),
                    SizedBox(height: size.height*0.03),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget> [
                        RoundedButtonMini(
                          text: "Delete",
                          press: () {

                          },
                        ),
                        SizedBox(width: size.width*0.04),
                        RoundedButtonMini(
                          text: "Add New",
                          press: () {

                          },

                        ),
                      ]
                    )
                  ]
                )
              ),

          ]
        )
      )
    );
  }
}
