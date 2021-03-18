import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constraint.dart';
import 'roundedButton.dart';
import 'logInPage.dart';
import 'signUpPage.dart';
class welcomePage extends StatelessWidget {
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
                      "Welcome to \n the Doctor's App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black
                      )
                  ),
                  SizedBox( height: size.height * 0.02),
                  SvgPicture.asset(
                      "Assets/Images/hospital.svg",
                      height: size.height * 0.4
                  ),
                  SizedBox( height: size.height * 0.02),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return logInPage();
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    color: kPrimaryLight,
                    textColor: Colors.black,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return signUpPage();
                          },
                        ),
                      );
                    },
                  )
                ]
            )
        )
    );
  }
}



