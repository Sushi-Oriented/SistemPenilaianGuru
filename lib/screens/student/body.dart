import 'package:flutter/material.dart';
import 'package:spg_test/components/custom_app_bar.dart';

import 'package:spg_test/constant.dart';
import 'package:spg_test/screens/student/dashboard_screen.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';

class DashboardStudBody extends StatelessWidget {
  const DashboardStudBody({state}) : _state = state;

  final DashboardStudState _state;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'SPG',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          icon: Icon(Icons.logout_rounded),
          pressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            )
          },
        ),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: spgPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
