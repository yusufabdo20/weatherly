import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherly/models/weather_model.dart';
import 'package:weatherly/screens/searchScreen.dart';
import 'package:weatherly/services/network/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather(String cityName) async {
    try {
      weatherModel = await WeatherServices(Dio())
          .getCurrentWeatherData(cityName: cityName);
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
