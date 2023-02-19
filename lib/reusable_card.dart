import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.colour,
      this.cardChild,
      this.blurRadius,
      this.spreadRadius,
      this.onPress});

  final Color colour;
  final Widget cardChild;
  final double blurRadius;
  final double spreadRadius;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
//        height: 200,
//        width: 170,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              //offset: Offset(0, 7),
            ),
          ],
          color: colour,
        ),
      ),
    );
  }
}
