import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'SPG',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: spgPrimaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: icon,
            iconSize: 25.0,
            onPressed: pressed,
            color: spgPrimaryColor,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
