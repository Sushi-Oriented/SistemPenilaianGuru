import 'package:flutter/material.dart';

import 'package:spg_test/components/text_field_container.dart';
import 'package:spg_test/screens/login/login_screen.dart';

import '../../../constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final Function press;
  final bool obscureText;
  final String hintText;
  final IconData icon;
  final Color color;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.icon = Icons.password,
    this.color = spgTierColor,
    this.press,
    this.obscureText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TexFieldContainer(
      // child: TextField(
      //   obscureText: obscureText,
      //   onChanged: onChanged,
      //   decoration: InputDecoration(
      //       hintText: hintText,
      //       icon: Icon(
      //         Icons.lock,
      //         color: spgTierColor,
      //       ),
      //       border: InputBorder.none,
      //       //suffixIcon: Icon(Icons.visibility, color: spgSecondaryColor)
      //       suffixIcon: IconButton(
      //         icon: Icon(
      //           Icons.visibility,
      //           color: spgTierColor,
      //         ),
      //         onPressed: press,
      //       )),
      // ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: color,
            ),
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.visibility,
                color: spgTierColor,
              ),
              onPressed: press,
            )),
      ),
    );
  }
}
