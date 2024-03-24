import 'package:weatherly/models/weather_model.dart';

class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  // final WeatherModel weatherModel;
  // WeatherSuccessState(this.weatherModel);
}

class WeatherErrorState extends WeatherStates {
  final String error;
  WeatherErrorState(this.error);
}
