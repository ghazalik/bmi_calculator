import 'package:flutter/material.dart';
import 'constants.dart';

class CardChildWidget extends StatelessWidget {
  CardChildWidget({this.iconType, this.iconSize, this.text});
  final IconData iconType;
  final double iconSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: iconSize,
          //color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$text',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
