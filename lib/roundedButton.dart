import 'package:flutter/material.dart';
import 'constraint.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width*0.8,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: color,
                onPressed: press,
                child: Text(
                    text,
                    style: TextStyle(
                        color: textColor
                    )
                )
            )
        )
    );
  }
}

class RoundedButtonMini extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButtonMini({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width*0.4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: color,
                onPressed: press,
                child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 12,
                        color: textColor
                    )
                )
            )
        )
    );
  }
}

class RoundedButtonCustom extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double rad;
  final double sizeMulti;
  const RoundedButtonCustom({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.rad =29.00,
    this.sizeMulti = 0.4

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width*sizeMulti,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(rad),
            child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: color,
                onPressed: press,
                child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 12,
                        color: textColor
                    )
                )
            )
        )
    );
  }
}