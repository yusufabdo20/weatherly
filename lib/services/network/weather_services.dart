import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherly/models/weather_model.dart';

class WeatherServices {
  Dio dio;
  WeatherServices(this.dio);
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '8014d8e79f2242a88af164815230310';
  Future<WeatherModel> getCurrentWeatherData({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      dynamic jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      return weatherModel;
    } on DioException catch (e) {
      String errorMsg =
          e.response?.data['error']['message'] ?? 'There is error , Try later';
      throw Exception(errorMsg);
    } catch (e) {
      log(e.toString());
      print(e.toString());
      throw Exception("There is error , Try later");
    }
  }
}
