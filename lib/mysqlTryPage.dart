import 'mysql.dart';
import 'package:flutter/material.dart';


class mysqlTryPage extends StatefulWidget {
  @override
  _mysqlTryPageState createState() => _mysqlTryPageState();
}

class _mysqlTryPageState extends State<mysqlTryPage> {
  var db = new Mysql();
  var patientList = [];
  void getPatients(){
    db.getConnection().then((conn) {
      String sql = 'select pid, fname, lname, email from patient_data;';
      conn.query(sql).then((results){
        for (var row in results){
          setState(() {
            patientList.add(row);
          });
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child:
        Column(
        children: <Widget>[
          FloatingActionButton(onPressed: getPatients),
          ListView(
              children:<Widget> [ DataTable(
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
          rows: patientList.map(
                  (user) => DataRow(
                  cells: [
                    DataCell(
                        Text(user[0].toString())
                    ),
                    DataCell(
                        Text(user[1]+" "+user[2])
                    ),
                    DataCell(
                        Text(user[3])
                    ),
                  ]
              )
          ).toList(),
        )
          ]),

        ])

      
    );
  }
}
