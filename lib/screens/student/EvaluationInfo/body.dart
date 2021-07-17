import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/screens/student/DashBoard/body.dart';
import 'package:spg_test/screens/student/Evaluate/evaluateScreen.dart';

class EvaluationInfoBody extends StatefulWidget {
  String text, textt, texttt;

  EvaluationInfoBody(
      {Key key,
      @required this.text,
      @required this.textt,
      @required this.texttt})
      : super(key: key);

  @override
  _EvaluationInfoBodyState createState() => _EvaluationInfoBodyState();
}

class _EvaluationInfoBodyState extends State<EvaluationInfoBody> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text('Testing'),),
    //      body: Center(
    //     child: Text(
    //       widget.text,
    //       style: TextStyle(fontSize: 24),
    //     ),
    //   ),

    // );

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(196, 196, 196, 100),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  // child: Image.asset('assets/design_course/webInterFace.png'),
                ),
              ],
            ),

            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 100.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      // constraints: BoxConstraints(
                      // minHeight: infoHeight,
                      // maxHeight: tempHeight > infoHeight
                      //     ? tempHeight
                      //     : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 100.0, left: 0, right: 0),
                            child: Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 0, right: 0),
                            child: Text(
                              widget.textt,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 0, right: 0),
                            child: Text(
                              widget.texttt,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 16, right: 16, bottom: 8, top: 16),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: <Widget>[
                          //       Text(
                          //         '\$28.99',
                          //         textAlign: TextAlign.left,
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w200,
                          //           fontSize: 22,
                          //           letterSpacing: 0.27,
                          //           color: DesignCourseAppTheme.nearlyBlue,
                          //         ),
                          //       ),
                          //       Container(
                          //         child: Row(
                          //           children: <Widget>[
                          //             Text(
                          //               '4.3',
                          //               textAlign: TextAlign.left,
                          //               style: TextStyle(
                          //                 fontWeight: FontWeight.w200,
                          //                 fontSize: 22,
                          //                 letterSpacing: 0.27,
                          //                 color: DesignCourseAppTheme.grey,
                          //               ),
                          //             ),
                          //             Icon(
                          //               Icons.star,
                          //               color: DesignCourseAppTheme.nearlyBlue,
                          //               size: 24,
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // AnimatedOpacity(
                          //   duration: const Duration(milliseconds: 500),
                          //   opacity: opacity1,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8),
                          //     child: Row(
                          //       children: <Widget>[
                          //         getTimeBoxUI('24', 'Classe'),
                          //         getTimeBoxUI('2hours', 'Time'),
                          //         getTimeBoxUI('24', 'Seat'),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Expanded(                                                        //penting
                          //   child: AnimatedOpacity(
                          //     duration: const Duration(milliseconds: 500),
                          //     opacity: opacity2,
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(
                          //           left: 16, right: 16, top: 8, bottom: 8),
                          //       child: Text(
                          //         'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                          //         textAlign: TextAlign.justify,
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w200,
                          //           fontSize: 14,
                          //           letterSpacing: 0.27,
                          //           color: DesignCourseAppTheme.grey,
                          //         ),
                          //         maxLines: 3,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: 1.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50.0, left: 50, bottom: 16, right: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardStudBody(),
                                          ),
                                        );
                                      },
                                      // width: 48,
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
                                            'Kembali',
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
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateBody(
                                                      teacher: widget.text)),
                                        );
                                      },
                                      child: Container(
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.blueAccent
                                                    .withOpacity(0.5),
                                                offset: const Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Mula Menilai',
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
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                      // ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
                top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 150,
                right: 0,
                left: 0,

                // child: Center(

                child: CircleAvatar(
                    radius: 70.0,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      child: Image.asset('assets/images/manIcon.jpg'),
                      borderRadius: BorderRadius.circular(80.0),
                    ))

                // )

                // ),

                // child: ScaleTransition(
                //   alignment: Alignment.center,
                //   scale: CurvedAnimation(
                //       parent: animationController, curve: Curves.fastOutSlowIn),
                // child: Card(
                //   color: Colors.blueAccent,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(50.0)),
                //   elevation: 10.0,
                //   child: Container(
                //     width: 60,
                //     height: 60,
                //     child: Center(
                //       child: Icon(
                //         Icons.favorite,
                //         color: Colors.white,
                //         size: 30,
                //       ),
                //     ),
                //   ),
                // ),
                ),

            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            //   child: SizedBox(
            //     width: AppBar().preferredSize.height,
            //     height: AppBar().preferredSize.height,
            //     child: Material(
            //       color: Colors.transparent,
            //       child: InkWell(
            //         borderRadius:
            //             BorderRadius.circular(AppBar().preferredSize.height),
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           color: DesignCourseAppTheme.nearlyBlack,
            //         ),
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
