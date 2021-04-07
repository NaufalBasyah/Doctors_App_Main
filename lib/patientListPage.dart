import 'package:flutter/material.dart';
import 'roundedButton.dart';
import 'mysql.dart';
import 'newPatientPage.dart';


class patientListPage extends StatefulWidget {
  @override
  _patientListPageState createState() => _patientListPageState();
}

class _patientListPageState extends State<patientListPage> {
  var db = new Mysql();
  var patientList = [];
  var selectedPatients = [];

  void getPatients() {
    db.getConnection().then((conn) {
      String sql = 'select pid, fname, lname, email from patient_data;';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            patientList.add(row);
          });
        }
      });
    });
  }

  @override
  DataTable patientDataTable() {
    return DataTable(
      columns: [
        DataColumn(
            label: Text("PID"),
            numeric: false,
            tooltip: "Patient ID"
        ),
        DataColumn(
            label: Text("Patient"),
            numeric: false,
            tooltip: "Patient Full Name"
        ),
        DataColumn(
            label: Text("Contact"),
            numeric: false,
            tooltip: "Patient Phone Number"
        )
      ],
      rows: patientList.map(
              (user) =>
              DataRow(
                  selected: selectedPatients.contains(user),
                  onSelectChanged: (b) {
                    print("onSelect");
                    onSelectedRow(b, user);
                  },
                  cells: [
                    DataCell(
                      Text(user[0].toString()),
                      onTap: () {

                      },
                    ),
                    DataCell(
                        Text(user[1] + " " + user[2])
                    ),
                    DataCell(
                        Text(user[3])
                    ),
                  ]
              )
      ).toList(),
    );
  }

  void onSelectedRow(bool b, List row) async{
    setState(() {
      if (b){
        selectedPatients.add(row);
      }else{
        selectedPatients.remove(row);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getPatients();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Container(
            height: size.height,
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                          children: <Widget>[
                            Text(
                                "Patients List",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                )
                            ),
                            SizedBox(height: size.height * 0.02),
                            Container(
                                height: size.height * .59,
                                child: SingleChildScrollView(
                                  child: patientDataTable(),
                                )
                            ),
                            SizedBox(height: size.height * 0.03),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  RoundedButtonMini(
                                    text: "Delete",
                                    press: () {

                                    },
                                  ),
                                  SizedBox(width: size.width * 0.04),
                                  RoundedButtonMini(
                                    text: "Add New",
                                    press: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) {
                                            return newPatientPage();
                                          }
                                      )
                                      );
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
