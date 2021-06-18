import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -120,
              left: -110,
              child: Image.asset(
                'assets/images/shape1.png',
                width: size.width * 0.8,
              ),
            ),
            Positioned(
              bottom: -80,
              right: -150,
              child: Image.asset(
                'assets/images/shape2.png',
                width: size.width * 0.7,
              ),
            ),
            child,
          ],
        ));
  }
}
