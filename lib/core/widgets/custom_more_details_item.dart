import 'package:flutter/material.dart';
import 'package:weatherly/core/widgets/custom_head_text_1.dart';

class CustomMoreDetailsItem extends StatelessWidget {
  String name;
  IconData icon;
  var value;
  String unit;
  CustomMoreDetailsItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.value,
    required this.unit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomHeadText1(
            text: this.name,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          Icon(icon),
          CustomHeadText1(
            text: "$value $unit",
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
