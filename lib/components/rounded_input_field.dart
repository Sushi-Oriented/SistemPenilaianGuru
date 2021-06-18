import 'package:flutter/material.dart';

import 'package:spg_test/components/text_field_container.dart';

import '../constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color;
  final TextEditingController controller;
  //final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.color = spgTierColor,
    //this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TexFieldContainer(
      // Import from text_field_container
      // child: TextField(
      //   onChanged: onChanged,
      //   decoration: InputDecoration(
      //       icon: Icon(
      //         icon,
      //         color: color,
      //       ),
      //       hintText: hintText,
      //       border: InputBorder.none),
      // ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: color,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
