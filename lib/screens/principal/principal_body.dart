import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/screens/login/login_screen.dart';
import 'package:spg_test/screens/principal/principal_screen.dart';
import 'package:spg_test/screens/student/components/custom_app_bar.dart';
import 'package:spg_test/services/auth_provider.dart';

class DashboardPrincipalBody extends StatefulWidget {
  // const DashboardPrincipalBody({ Key? key }) : super(key: key);
  DashboardPrincipalBody({state}) : _state = state;
  final PrincipalScreenState _state;

  @override
  _DashboardPrincipalBodyState createState() => _DashboardPrincipalBodyState();
}

class _DashboardPrincipalBodyState extends State<DashboardPrincipalBody> {

  

  var all = FirebaseFirestore.instance
  .collection('subject')
  .snapshots();

void alllist(){
    setState(() {
      all = FirebaseFirestore.instance
  .collection('subject')
  .snapshots();
    });
  }

  void bm(){
    setState(() {
      all = FirebaseFirestore.instance
  .collection('subject')
  .where('abbr', isEqualTo: 'BM')
  .snapshots();
  print("object");
    });
  }

  void bi(){
    setState(() {
        all = FirebaseFirestore.instance
  .collection('subject')
  .where('abbr', isEqualTo: 'ENG')
  .snapshots();
    });
  }

    void sn(){
    setState(() {
      all = FirebaseFirestore.instance
  .collection('subject')
  .where('abbr', isEqualTo: 'SN')
  .snapshots();
    });
  }

    void mt(){
    setState(() {
      all = FirebaseFirestore.instance
  .collection('subject')
  .where('abbr', isEqualTo: 'MT')
  .snapshots();
    });
  }


  



  

  

  
          

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
        stream: all,
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
                        "Senarai Guru SK Bangsar",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, bottom: 20, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(

                                    child: InkWell(
                                      onTap: alllist,
                                    // width: 48,
                                    
                                    child: Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'All',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(

                                    child: InkWell(
                                      onTap: bm,
                                    child: Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'BM',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(

                                    child: InkWell(
                                      onTap: bi,
                                    child: Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'BI',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(

                                    child: InkWell(
                                      onTap: sn,
                                    child: Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'SN',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(

                                    child: InkWell(
                                      onTap: mt,
                                    child: Container(
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'MT',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),


                Expanded(
                  child: snapshot.hasData
            ?ListView.separated(
              itemCount: snapshot.data.docs.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color.fromRGBO(196, 196, 196, 100),
                            child: Text((index + 1).toString(),
                                style: TextStyle(color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    )),
                          ),
                          title: Text(snapshot.data.docs[index]['teacher'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text(snapshot.data.docs[index]['name'] + '\n'+ snapshot.data.docs[index]['kelas'],
                              style: TextStyle(
                                    fontSize: 13.0,
                                    // fontWeight: FontWeight.bold,
                                  )),
                          
                          onTap: () {

                            //  Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) => EvaluationInfoBody(text: document['teacher'],textt: document['name'],texttt: document['kelas'],),
                            // ),
                            // );
                          },
                        ),
              
            )
            : Center(child: Text('asdsd')),


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
                Text(widget._state.email,
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
                  "Principal",
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
