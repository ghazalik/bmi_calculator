import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_containers_content.dart';
import 'buttom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

// male=1, female=2
class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  Gender selectedGender;

  double maleBlurRadius = 0.0;
  double maleSpreadRadius = 0.0;

  double femaleBlurRadius = 0.0;
  double femaleSpreadRadius = 0.0;

  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    blurRadius: maleBlurRadius = selectedGender == Gender.male
                        ? kActiveBlurRadius
                        : kInactiveBlurRadius,
                    spreadRadius: maleSpreadRadius =
                        selectedGender == Gender.male
                            ? kActiveSpreadRadius
                            : kInactiveSpreadRadius,
                    colour: maleCardColour = selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: CardChildWidget(
                      text: 'MALE',
                      iconType: FontAwesomeIcons.mars,
                      iconSize: 70.0,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    blurRadius: femaleBlurRadius =
                        selectedGender == Gender.female
                            ? kActiveBlurRadius
                            : kInactiveBlurRadius,
                    spreadRadius: femaleSpreadRadius =
                        selectedGender == Gender.female
                            ? kActiveSpreadRadius
                            : kInactiveSpreadRadius,
                    colour: femaleCardColour = selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: CardChildWidget(
                      text: 'FEMALE',
                      iconType: FontAwesomeIcons.venus,
                      iconSize: 70.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              blurRadius: 10.0,
              spreadRadius: 2.0,
              colour: kActiveCardColour,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kHeavyWeightFont,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: kBottomContainerColour,
                      overlayColor: kBottomContainerColour.withOpacity(0.16),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      //activeColor: Color(0xffffffff),
                      //inactiveColor: Color(0xff8d8e98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });

                        print(newValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    colour: kActiveCardColour,
                    cardChild: BottomContainersContent(
                      header: 'WEIGHT',
                      weight: weight,
                      heavyWeightType: weight,
                      iconMinusData: FontAwesomeIcons.minus,
                      iconAddData: FontAwesomeIcons.plus,
                      onMinus: () {
                        setState(() {
                          weight--;
                        });
                        print(weight);
                      },
                      onAdd: () {
                        setState(() {
                          weight++;
                        });
                        print(weight);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    colour: kActiveCardColour,
                    cardChild: BottomContainersContent(
                      header: 'AGE',
                      age: age,
                      heavyWeightType: age,
                      iconMinusData: FontAwesomeIcons.minus,
                      iconAddData: FontAwesomeIcons.plus,
                      onMinus: () {
                        setState(() {
                          age >= 1 ? age-- : print(age);
                        });
                        print(age);
                      },
                      onAdd: () {
                        setState(() {
                          age <= 149 ? age++ : print(age);
                        });
                        print(age);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
