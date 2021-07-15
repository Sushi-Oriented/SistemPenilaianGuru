import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:spg_test/components/user_image.dart';
// import 'package:spg_test/components/user_info.dart';
// import 'package:spg_test/components/user_name.dart';

// import 'package:spg_test/constant.dart';
import 'package:spg_test/screens/login/login_screen.dart';
import 'package:spg_test/screens/student/EvaluationInfo/body.dart';
import 'package:spg_test/screens/student/EvaluationInfo/evaluationInfo_screen.dart';

import 'package:spg_test/screens/student/components/custom_app_bar.dart';
// import 'package:spg_test/screens/welcome/welcome_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spg_test/services/auth_provider.dart';

import 'dashboard_screen.dart';



class DashboardStudBody extends StatefulWidget {
  // const DashboardStudBody({ Key? key }) : super(key: key);
  DashboardStudBody({state}) : _state = state;
  final DashboardStudState _state;

  List lists ;
  
  @override
  _DashboardStudBodyState createState() => _DashboardStudBodyState();
}

class _DashboardStudBodyState extends State<DashboardStudBody> {

  TextEditingController textFieldController = TextEditingController();
  String textToSend = 'textFieldController.text';

  // final Stream<QuerySnapshot> dbRef = FirebaseFirestore.instance.collection("subject").snapshots();
  

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
                      // snapshot.data.docs.map((DocumentSnapshot document) {}).toList()


        
        
                      // child: ListView.separated(
                        
                      //       shrinkWrap: true,
                      //       padding: const EdgeInsets.all(20),
                      //       itemCount: 10,
                            

                      //       itemBuilder: (context, index){
                      //         return Card(
                      //           color: Color.fromRGBO(244, 244, 244, 10),
                      //           child: ListTile(
                                  
                      //             leading: CircleAvatar(
                      //               backgroundColor: Color.fromRGBO(196, 196, 196, 100),
                      //               child: Text('BM',
                      //               style: TextStyle(
                      //                 color: Colors.black
                      //                       // fontSize: 20.0,
                      //                       // fontWeight: FontWeight.bold,
                      //                     )),
                      //               ),
                            
                      //           title: Text('Bahasa Melayu',
                      //           style: TextStyle(
                      //                       fontSize: 20.0,
                      //                       fontWeight: FontWeight.bold,
                      //                     )),
                      //         subtitle: Text('En Faizul Bin Awang'),
                      //           ),
                      //         );
                      //       },
                      //       separatorBuilder: (BuildContext context, int index) => const Divider(),
                      //     )


                     // child: StreamBuilder<QuerySnapshot>(
                      //   stream: dbRef,
                      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      //     if (snapshot.hasError) {
                      //       return Text('Something went wrong');
                      //     }

                      //     if (snapshot.connectionState == ConnectionState.waiting) {
                      //       return Text("Loading");
                      //     }

                      //     return new ListView(
                      //       children: snapshot.data.docs.map((DocumentSnapshot document) {
                      //       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      //         return new ListTile(
                      //           title: new Text(data['abbr']),
                      //           subtitle: new Text(data['teacher']),
                      //            onTap: () {

                      //       Navigator.push(context, MaterialPageRoute(
                      //         builder: (context) => EvaluationInfoBody(text: 'testing',),
                      //         // builder: (context) => EvaluationInfoBody(text: (data['teacher']),),
                      //       ),
                      //       );


                      //     },
                      //         );
                      //       }).toList(),
                      //     );
                      //   },
                      // )

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
                          
                          onTap: () {

                             Navigator.push(context, MaterialPageRoute(
                              builder: (context) => EvaluationInfoBody(text: document['teacher'],textt: document['name'],texttt: document['kelas'],),
                            ),
                            );
                          },

                          

                        ),
                      );
                    }).toList(),
                  ),



                )
                    
                     
                  
                  
                  // child: FutureBuilder(
                  //       // future: widget._state.lists,
                  //       builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
                  //           if (snapshot.hasData) {

                  //           // widget._state.lists.clear();
                  //           Map<dynamic, dynamic> values = snapshot.data.value;
                  //           values.forEach((key, values) {
                  //               widget._state.lists.add(values);
                  //           });
                  //           return new ListView.builder(
                  //               shrinkWrap: true,
                  //               itemCount: widget._state.lists.length,
                                
                  //               // itemCount: 4, //testing
                  //               itemBuilder: (BuildContext context, int index) {
                  //                   return Card(
                  //                   child: Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: <Widget>[
                  //                        Text(widget._state.lists.length.toString())
                                          
                  //                       // Text("Name: " + snapshot.data.value[index]["abbr"]),
                  //                       // Text("Age: "+ snapshot.data.value[index]["name"]),
                  //                       // Text("Type: " +snapshot.data.value[index]["teacher"]),
                  //                       ],
                  //                   ),
                  //                   );
                  //               });
                  //           }
                  //           return CircularProgressIndicator();
                  //       }),

                  



                  // child: ListView(
                    
                  //   children: snapshot.data.docs.map((DocumentSnapshot document) {
                  //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;  
                  //     // itemCount: widget._state.lists.length;
                  //     // lists.clear();
                  //     return Card(
                  //       color: Color.fromRGBO(244, 244, 244, 10),
                  //       child: ListTile(
                  //         leading: CircleAvatar(
                  //           backgroundColor: Color.fromRGBO(196, 196, 196, 100),
                  //           child: Text(data['abbr'],
                  //               style: TextStyle(color: Colors.black
                  //                   // fontSize: 20.0,
                  //                   // fontWeight: FontWeight.bold,
                  //                   )),
                  //         ),
                  //         title: Text(data['name'],
                  //             style: TextStyle(
                  //               fontSize: 20.0,
                  //               fontWeight: FontWeight.bold,
                  //             )),
                  //         subtitle: Text(data.toString()),
                  //         onTap: () {

                  //           Navigator.push(context, MaterialPageRoute(
                  //             builder: (context) => EvaluationInfoBody(text: 'testing',),
                  //             // builder: (context) => EvaluationInfoBody(text: (data[3]['name']),),
                  //           ),
                  //           );


                  //         },
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),



                // )
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
                Text('${widget._state.email}',
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


  Widget getList() {
    
      
      
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      itemCount: 10,
       

      itemBuilder: (context, index){
        return Card(
           color: Color.fromRGBO(244, 244, 244, 10),
          child: ListTile(
            
            leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(196, 196, 196, 100),
              child: Text('BM',
              style: TextStyle(
                color: Colors.black
                      // fontSize: 20.0,
                      // fontWeight: FontWeight.bold,
                    )),
              ),
      
          title: Text('Bahasa Melayu',
          style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
        subtitle: Text('En Faizul Bin Awang'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );


}

