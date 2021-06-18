import 'package:flutter/material.dart';
// import 'package:spg_test/components/user_image.dart';
// import 'package:spg_test/components/user_info.dart';
// import 'package:spg_test/components/user_name.dart';

// import 'package:spg_test/constant.dart';
import 'package:spg_test/provider/auth_provider.dart';
import 'package:spg_test/screens/login/login_screen.dart';

import 'package:spg_test/screens/student/components/custom_app_bar.dart';
import 'package:spg_test/screens/student/dashboard_screen.dart';
// import 'package:spg_test/screens/welcome/welcome_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('subject').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            color: Color.fromRGBO(255, 255, 255, 100),
            child: Column(
              children: [
                getDetails(),
                Container(
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
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: snapshot.data.docs.map((document) {
                      return Card(
                        color: Color.fromRGBO(244, 244, 244, 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color.fromRGBO(196, 196, 196, 100),
                            child: Text(document['abbr'],
                                style: TextStyle(color: Colors.black
                                    // fontSize: 20.0,
                                    // fontWeight: FontWeight.bold,
                                    )),
                          ),
                          title: Text(document['name'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text(document['teacher']),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getDetails() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 100),
          // border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("data"),
                CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      child: Image.asset('assets/images/manIcon.jpg'),
                      borderRadius: BorderRadius.circular(80.0),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${_state.email}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "3 Cempaka",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ), // Kelas Pelajar
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
