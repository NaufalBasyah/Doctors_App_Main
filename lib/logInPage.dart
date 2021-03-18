import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constraint.dart';
import 'roundedButton.dart';
import 'roundedInputField.dart';
import 'roundedPasswordField.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'accountCheck.dart';
import 'signUpPage.dart';
import 'orDivider.dart';
import 'homePage.dart';


class logInPage extends StatelessWidget {
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
                    "LOGIN",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                    )
                  ),
                  SizedBox( height: size.height * 0.02),
                  SvgPicture.asset(
                    "Assets/Images/doctor.svg",
                    height: size.height * 0.32
                  ),
                  SizedBox( height: size.height * 0.02),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context){
                            return homePage();
                          }
                      )
                      );
                    },
                  ),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                       context, MaterialPageRoute(
                        builder: (context){
                          return signUpPage();
                        }
                      )
                      );
                    }
                  ),
                  // OrDivider(),
                  // SignInButton(
                  //   Buttons.GoogleDark,
                  //   text: "Login with Google",
                  //   onPressed: () {},
                  // ),
                  // SignInButton(
                  //   Buttons.FacebookNew,
                  //   text: "Login with Facebook",
                  //   onPressed: () {},
                  // ),
                ]
              )
    )
    );
  }
}



