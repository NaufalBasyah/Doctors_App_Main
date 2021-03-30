import 'package:flutter/material.dart';
import 'constraint.dart';
import 'roundedButton.dart';
import 'roundedInputField.dart';
import 'roundedPasswordField.dart';


class newAppointmentPage extends StatefulWidget {
  @override
  _newAppointmentPageState createState() => _newAppointmentPageState();
}

class _newAppointmentPageState extends State<newAppointmentPage> {
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
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                  SizedBox( height: size.height * 0.008),
                  RoundedInputField(
                    hintText: "Your Email",
                    icon: Icons.alternate_email_outlined,
                    onChanged: (value) {},
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        RoundedInputFieldMini(
                          hintText: "First Name",
                          onChanged: (value) {},
                        ), RoundedInputFieldMini(
                          hintText: "Last Name",
                          onChanged: (value) {},
                        ),
                      ]
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {},
                  ),
                ]
            )
        )
    );
  }
}
