import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.buttonText});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBottomContainerColour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
