import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'Icon_content.dart';
import 'constants.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      tab: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? KColorbox
                          : kColorboxclicked,
                      cardChild: ContentIcon(
                          label: "MALE", icon: FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      tab: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? KColorbox
                          : kColorboxclicked,
                      cardChild: ContentIcon(
                          label: "FEMALE", icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        children: <Widget>[
                          Text("test", style: kLabelTextStyle)
                        ],
                      ),
                      colour: KColorbox,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: KColorbox,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: KColorbox,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: KBottomcolor,
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
            )
          ],
        ),
      ),
    );
  }
}
