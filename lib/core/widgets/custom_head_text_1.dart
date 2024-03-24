import 'package:flutter/material.dart';

class CustomHeadText1 extends StatelessWidget {
  CustomHeadText1({
    super.key,
    required this.text,
    this.fontSize = 50,
    this.fontWeight = FontWeight.normal,
    this.textColor,
  });
  String text;
  double fontSize;
  Color? textColor;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: textColor,
        fontFamily: 'Khand',
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
      ),
    );
  }
}
