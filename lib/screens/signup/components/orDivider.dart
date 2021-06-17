import 'package:flutter/material.dart';

import '../../../constant.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Row(
        children: <Widget>[
          BuilDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Or",
              style: TextStyle(
                  color: spgPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          BuilDivider(),
        ],
      ),
    );
  }
}

class BuilDivider extends StatelessWidget {
  const BuilDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: spgTierColor,
        height: 1.5,
      ),
    );
  }
}
