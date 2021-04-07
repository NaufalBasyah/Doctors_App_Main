import 'mysql.dart';
import 'package:flutter/material.dart';


class mysqlTryPage extends StatefulWidget {
  @override
  _mysqlTryPageState createState() => _mysqlTryPageState();
}

class _mysqlTryPageState extends State<mysqlTryPage> {
  var db = new Mysql();
  var patientList = [];
  void getUsers(){
    db.getConnection().then((conn) {
      String sql = 'select id, username, password from users;';
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
  void initState(){
    super.initState();
    getUsers();
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
          ListView(
        //       children:<Widget> [ DataTable(
        //   columns: [
        //     DataColumn(
        //         label:Text("PID"),
        //         numeric: false,
        //         tooltip: "ID"
        //     ),
        //     DataColumn(
        //         label:Text("Username"),
        //         numeric: false,
        //         tooltip: "Username"
        //     ),
        //     DataColumn(
        //         label:Text("Pass"),
        //         numeric: false,
        //         tooltip: "Pass"
        //     )
        //   ],
        //   rows: patientList.map(
        //           (user) => DataRow(
        //           cells: [
        //             DataCell(
        //                 Text(user[0].toString())
        //             ),
        //             DataCell(
        //                 Text(user[1])
        //             ),
        //             DataCell(
        //                 Text(user[2])
        //             ),
        //           ]
        //       )
        //   ).toList(),
        // )
        //   ]
          ),
          Text(patientList[0].toString()),
          Text(patientList[1].toString()),
          Text(patientList[2].toString())

        ])

      
    );
  }
}
