import 'package:flutter/material.dart';

import 'package:spg_test/components/background.dart';
import 'package:spg_test/constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function pressed;
  final Icon icon;
  final Text title;

  const CustomAppBar({
    Key key,
    this.icon,
    this.pressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: title,
        actions: <Widget>[
          IconButton(
            icon: icon,
            iconSize: 30.0,
            onPressed: pressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
