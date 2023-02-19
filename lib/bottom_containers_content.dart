import 'package:flutter/material.dart';
import 'constants.dart';
import 'round_icon_button.dart';

class BottomContainersContent extends StatelessWidget {
  BottomContainersContent({
    this.weight,
    this.onMinus,
    this.onAdd,
    this.iconMinusData,
    this.iconAddData,
    this.header,
    this.heavyWeightType,
    this.age,
  });

  final int weight;
  final int age;
  final IconData iconMinusData;
  final IconData iconAddData;
  final Function onMinus;
  final Function onAdd;
  final String header;
  final int heavyWeightType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          header,
          style: kLabelTextStyle,
        ),
        Text(
          heavyWeightType.toString(),
          style: kHeavyWeightFont,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              iconName: iconMinusData,
              onPressed: onMinus,
//              onPressed: () {
//                //setState(() {
//                  weight--;
//                //});
//              },
            ),
            RoundIconButton(
              iconName: iconAddData,
              onPressed: onAdd,
//              onPressed: () {
//                //setState(() {
//                  weight++;
//                //});
//              },
            ),
          ],
        ),
      ],
    );
  }
}
