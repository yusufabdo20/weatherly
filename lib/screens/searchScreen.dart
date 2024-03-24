import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/core/widgets/custom_head_text_1.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherly/models/weather_model.dart';
import 'package:weatherly/screens/home_screen.dart';
import 'package:weatherly/services/network/weather_services.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomHeadText1(
          text: 'Search',
          fontSize: 25,
        ),
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: searchController,
            onChanged: (value) {},
            onSubmitted: (value) async {
              var weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              weatherCubit.getWeather(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Search on your City',
              label: CustomHeadText1(
                text: 'search',
                fontSize: 25,
                textColor: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
