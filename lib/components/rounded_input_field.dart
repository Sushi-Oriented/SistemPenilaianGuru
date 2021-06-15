import 'package:flutter/material.dart';
import 'package:spg_test/components/text_field_container.dart';
import '../../constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hinText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TexFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(icon), hintText: hinText, border: InputBorder.none),
      ),
    );
  }
}
