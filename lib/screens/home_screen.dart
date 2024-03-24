import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherly/core/widgets/custom_head_text_1.dart';
import 'package:weatherly/core/widgets/custom_more_details_item.dart';
import 'package:weatherly/core/widgets/custom_temp_widget.dart';
import 'package:weatherly/core/widgets/no_weather_info.dart';
import 'package:weatherly/core/widgets/weatherInfo.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherly/screens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ),
          );
        },
        child: Icon(Icons.search),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherInfo();
          } else if (state is WeatherSuccessState) {
            return WeatherInfo();
          } else {
            return Center(child: Text("There is Error  , Try Later"));
          }
        },
      ),
    );
  }
}
