import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/Icon_content.dart';
import '../constants.dart';
import '../calculator.dart';
import './result.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 50;
  int age = 18;
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
                          ? kColorboxclicked
                          : KColorbox,
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
                          ? kColorboxclicked
                          : KColorbox,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("HEIGHT", style: kLabelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(height.toString(), style: knumbertext),
                              Text(
                                "cm",
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: KBottomcolor,
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29EB1555),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              onChanged: (number) {
                                setState(() {
                                  height = number.toInt();
                                });
                              },
                              max: 220,
                              min: 150,
                              // KBottomcolor
                              inactiveColor: kInactiveColor,
                            ),
                          )
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: knumbertext,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                press: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  press: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: KColorbox,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumbertext,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                press: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  press: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator calculator =
                    Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => result(
                      bmiResult: calculator.CalculateBMI(),
                      resultext: calculator.getResult(),
                      interp: calculator.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Text(
                    "CALCULATE",
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
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.child, this.press});
  final Widget? child;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: child,
        onPressed: press,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 6,
        constraints: BoxConstraints.tightFor(width: 56, height: 56));
  }
}
