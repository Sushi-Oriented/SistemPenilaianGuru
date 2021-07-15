import 'package:flutter/material.dart';

class RoundedLoginButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  const RoundedLoginButton({
    Key key,
    this.text,
    this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              primary: color,
            )),
      ),
    );
  }
}
