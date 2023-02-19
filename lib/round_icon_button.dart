import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconName, @required this.onPressed});

  final IconData iconName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconName,
        size: 20.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
      onPressed: onPressed,
      elevation: 19,
    );
  }
}
