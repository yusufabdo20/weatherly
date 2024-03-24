import 'package:flutter/material.dart';
import 'package:weatherly/core/widgets/custom_head_text_1.dart';

class CustomTempWidget extends StatelessWidget {
  CustomTempWidget({
    super.key,
    required this.text,
    required this.temp,
  });
  String text;
  double temp;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.black, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              // spreadRadius: 0,
              offset: Offset(3, 5),
            ),
          ],
        ),
        child: CustomHeadText1(
          text: "$text : $temp",
          fontSize: 30,
        ),
      ),
    );
  }
}
