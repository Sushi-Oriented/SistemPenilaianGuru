import 'package:flutter/material.dart';
import 'package:spg_test/components/user_image.dart';
import 'package:spg_test/components/user_info.dart';
import 'package:spg_test/components/user_name.dart';

import 'package:spg_test/constant.dart';

import 'package:spg_test/screens/student/components/custom_app_bar.dart';

import 'package:spg_test/screens/student/dashboard_screen.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';

class DashboardStudBody extends StatelessWidget {
  const DashboardStudBody({state}) : _state = state;

  final DashboardStudState _state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icon(Icons.logout_rounded),
        pressed: () => {
          // To be changed
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      UserImage(
                        image: Image.asset(
                            'assets/images/userPic.jpg'), // Gambar Pelajar - Rasanya method ni kena ubah, kutt
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      UserName(
                        text: "Park Seo Joonoi", // Nama Pelajar - Mock Data
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      UserInfo(
                        text: "3 SECJ",
                      ) // Kelas Pelajar
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
