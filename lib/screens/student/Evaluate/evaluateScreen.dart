import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/models/scale.dart';

class EvaluateBody extends StatefulWidget {
  String teacher;
  EvaluateBody({Key key, @required this.teacher}) : super(key: key);

  @override
  _EvaluateBodyState createState() => _EvaluateBodyState();
}

class _EvaluateBodyState extends State<EvaluateBody> {
  String _userID = FirebaseAuth.instance.currentUser.uid;
  get userID => _userID;
  int total = 0;
  int total2 = 0;
  double percentage = 0;


  @override
  Widget build(BuildContext context) {
    String subject;
    if (widget.teacher == "Fei Zhi") {
      subject = "subject1";
    } else if (widget.teacher == "Hasan Mubarak") {
      subject = "subject2";
    } else if (widget.teacher == "Arif Masyhur") {
      subject = "subject3";
    } else {
      subject = "subject4";
    }
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(widget.teacher),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('evaluate').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data.docs[index]['title']),
                subtitle: Text(snapshot.data.docs[index]['desc']),
                trailing: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(userID)
                      .collection('evalution')
                      .doc(subject)
                      .snapshots(),
                  builder: (context, val) {
                    if (!val.hasData) {
                      return Text('x');
                    } else {
                      int current = index + 1;

                      total = total + val.data['q' + '$current'];
                      print('total per ques :' + total.toString());
                      total2 = total ;

                        

                      return DropdownButton(
                        // value: snapshot.data.docs[index]['set'],
                        
                        value: val.data['q' + '$current'],
                        items: scales
                            .map(
                              (scale) => DropdownMenuItem(
                                value: scale.value,
                                child: Text(scale.title),
                              ),
                            )
                            .toList(),
                        onChanged: (newValue) async {
                          final sql = FirebaseFirestore.instance
                              .collection("users")
                              .doc(userID)
                              .collection('evalution')
                              .doc(subject);
                          if ((await sql.get()).exists) {
                            if (index == 0) {
                              print(val.data['q' + '$current']);
                              print(newValue);
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q1": newValue,
                                "percentage" : percentage,
                              });
                              
                              
                            } else if (index == 1) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q2": newValue,
                                "percentage" : percentage,
                              });
                            } else if (index == 2) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q3": newValue,
                                "percentage" : percentage,
                              });
                            } else if (index == 3) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q4": newValue,
                                "percentage" : percentage,
                              });
                            } else if (index == 4) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q5": newValue,
                                "percentage" : percentage,
                              });
                            } else if (index == 5) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q6": newValue,
                                "percentage" : percentage,
                              });
                            } else if (index == 6) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q7": newValue,
                                "percentage" : percentage,
                              });
                            } else if (index == 7) {
                              total2 = total2 - val.data['q' + '$current'] + newValue;
                              percentage = (total2 / 32)*100;
                              total = 0 ;
                              await sql.update({
                                "q8": newValue,
                                "percentage" : percentage,
                              });
                            }
                           

                            print('Exist');
                          } else {
                            // await _db.collection("users").doc(user.uid).set(userData);
                            print('Not Exist');
                          }
                        },
                      );
                    }
                  },
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.grey,
          label: Text('Hantar'),
          onPressed: () => Navigator.of(context).pop()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
