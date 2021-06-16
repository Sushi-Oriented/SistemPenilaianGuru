import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String text;
  const UserInfo({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
