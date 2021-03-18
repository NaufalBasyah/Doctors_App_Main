import 'package:doctor_app/logInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'roundedButton.dart';

class dashboardPage extends StatelessWidget {
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
                                press: () {},
                              )
                            ]
                          )
                       ]
                      )
                    )
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
                              DataTable(
                                  columns: [
                                    DataColumn(label: Text('Starts')),
                                    DataColumn(label: Text('Ends')),
                                    DataColumn(label: Text('Patient')),
                                    DataColumn(label: Text('Type')),
                                  ],
                                  rows: [
                                    DataRow(
                                      cells: [
                                        DataCell(Text('10.00 AM')),
                                        DataCell(Text('10.30 AM')),
                                        DataCell(Text('John Doe')),
                                        DataCell(Text('Something'))
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('10.00 AM')),
                                        DataCell(Text('10.30 AM')),
                                        DataCell(Text('John Doe')),
                                        DataCell(Text('Something'))
                                      ],
                                    ),
                                    DataRow(
                                      cells: [
                                        DataCell(Text('10.00 AM')),
                                        DataCell(Text('10.30 AM')),
                                        DataCell(Text('John Doe')),
                                        DataCell(Text('Something'))
                                      ],
                                    ),
                                  ]
                              )

                            ]
                          )
                      )
                  ),
                  Container(
                      height: size.height*0.28,
                      child:Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Text("Health Articles",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  children: <Widget> [
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 37.0),
                                        title: Text('Random News About Stuff'),
                                        subtitle: Text('Blablablablablablablablablabla'),
                                        // trailing: Icon(Icons.beenhere_outlined),
                                      ),
                                    ),

                                  ]

                                )

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



