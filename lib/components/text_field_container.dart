import 'package:flutter/material.dart';
import '../../../constant.dart';

class TexFieldContainer extends StatelessWidget {
  final Widget child;
  const TexFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: spgSecondaryColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
