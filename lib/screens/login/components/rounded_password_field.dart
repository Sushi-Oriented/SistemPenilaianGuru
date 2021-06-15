import 'package:flutter/material.dart';
import 'package:spg_test/screens/login/components/text_field_container.dart';
import 'package:spg_test/screens/login/login_screen.dart';

import '../../../constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    @required LoginScreenState state,
  })  : _state = state,
        super(key: key);

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return TexFieldContainer(
      child: TextField(
        obscureText: !_state.showPassword,
        onChanged: (value) => _state.password = value,
        decoration: InputDecoration(
            hintText: "Insert your password",
            icon: Icon(
              Icons.lock,
              color: spgTierColor,
            ),
            border: InputBorder.none,
            //suffixIcon: Icon(Icons.visibility, color: spgSecondaryColor)
            suffixIcon: IconButton(
              icon: Icon(
                Icons.visibility,
                color: spgTierColor,
              ),
              onPressed: () => _state.showPassword = !_state.showPassword,
            )),
      ),
    );
  }
}
