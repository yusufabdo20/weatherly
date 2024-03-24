import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/core/utills/appUtills.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherly/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: AppUtills.getColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherState,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        });
      }),
    );
  }
}
