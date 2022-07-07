import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/Icon_content.dart';
import '../constants.dart';

class result extends StatelessWidget {
  result(
      {required this.bmiResult, required this.resultext, required this.interp});
  String bmiResult;
  String resultext;
  String interp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Expanded(
              child: Text(
                "Your result",
                style: knumbertext,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: KColorbox,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultext,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(bmiResult, style: knumbertext2),
                  Text(
                    interp,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text(
                  "RECALCULATE",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: KBottomcolor,
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
