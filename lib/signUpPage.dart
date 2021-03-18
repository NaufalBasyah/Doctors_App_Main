import 'package:doctor_app/logInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constraint.dart';
import 'roundedButton.dart';
import 'roundedInputField.dart';
import 'roundedPasswordField.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'accountCheck.dart';
import 'orDivider.dart';

class signUpPage extends StatelessWidget {
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
                      "SIGNUP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                  SizedBox( height: size.height * 0.008),
                  SvgPicture.asset(
                      "Assets/Images/clipboard.svg",
                      height: size.height * 0.2
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
                  AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context){
                              return logInPage();
                            }
                        )
                        );
                      }
                  ),
                  OrDivider(),
                  Column(
                    children: <Widget>[
                      SignInButton(
                        Buttons.GoogleDark,
                        text: "Signup with Google",

                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.FacebookNew,
                        text: "Signup with Facebook",

                        onPressed: () {},
                      )
                    ],

                  )
                ]
            )
        )
    );
  }
}



