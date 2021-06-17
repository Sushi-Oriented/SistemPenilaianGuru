import 'package:flutter/material.dart';
import 'package:spg_test/components/user_image.dart';
import 'package:spg_test/components/user_info.dart';
import 'package:spg_test/components/user_name.dart';

import 'package:spg_test/constant.dart';
import 'package:spg_test/provider/auth_provider.dart';
import 'package:spg_test/screens/login/login_screen.dart';

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
          AuthClass().signOut(),
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false)
        },
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Container(
                width: 300,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: spgPrimaryColor,
                  border: Border.all(color: Colors.transparent),
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
                          text: _state.email,
                          //text: "Park Seo Joonoi", // Nama Pelajar - Mock Data
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
                          text: "3 SECJ", // Kelas Pelajar
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Senarai Subjek Untuk Penilaian",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
