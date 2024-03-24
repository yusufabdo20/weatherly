import 'package:flutter/material.dart';
import 'package:weatherly/core/widgets/custom_head_text_1.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomHeadText1(
        text: "search on city",
        fontWeight: FontWeight.bold,
        // textColor: Colors.blueGrey,
      ),
    );
  }
}
