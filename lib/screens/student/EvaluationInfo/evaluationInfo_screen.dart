import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/screens/student/EvaluationInfo/body.dart';

class EvaluationInfoScreen extends StatelessWidget {
  // const EvaluationInfoScreen({ Key? key }) : super(key: key);

    static Route route() =>
      MaterialPageRoute(builder: (context) => EvaluationInfoScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: EvaluationInfoBody(text: '',textt: '',texttt: '',),
        ),
      ),
    );
  }
}