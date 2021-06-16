import 'package:flutter/material.dart';

import 'package:spg_test/components/background.dart';
import 'package:spg_test/constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function pressed;
  final Icon icon;

  const CustomAppBar({
    Key key,
    this.icon,
    this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: spgPrimaryColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'SPG',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: icon,
            iconSize: 25.0,
            onPressed: pressed,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
