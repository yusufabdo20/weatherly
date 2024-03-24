import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/core/utills/appUtills.dart';
import 'package:weatherly/core/widgets/custom_head_text_1.dart';
import 'package:weatherly/core/widgets/custom_more_details_item.dart';
import 'package:weatherly/core/widgets/custom_temp_widget.dart';
import 'package:weatherly/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherly/main.dart';
import 'package:weatherly/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppUtills.getColor(weatherModel.weatherState)[50]!,
              AppUtills.getColor(weatherModel.weatherState)[500]!,
              AppUtills.getColor(weatherModel.weatherState)[900]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeadText1(
                    text: weatherModel.cityName, fontWeight: FontWeight.bold),
                CustomHeadText1(
                  text: 'Status :${weatherModel.weatherState}',
                  fontSize: 40,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppUtills.getImage(weatherModel.weatherState),
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 8,
                                // blurStyle: BlurStyle.inner,
                                color: Colors.grey,
                                offset: Offset(3, 6)),
                          ]
                          // border: Border.all(
                          //   width: 2,
                          // ),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomHeadText1(
                            text: weatherModel.temp.toString(),
                            fontSize: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomHeadText1(
                                text:
                                    'Date : ${weatherModel.date.day} - ${weatherModel.date.month} - ${weatherModel.date.year}  ',
                                fontSize: 25,
                              ),
                              CustomHeadText1(
                                text:
                                    'Lasted Updated : ${weatherModel.date.hour}:${weatherModel.date.minute}',
                                fontSize: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomTempWidget(
                      text: 'Min',
                      temp: weatherModel.minTemp,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomTempWidget(
                      text: 'Max',
                      temp: weatherModel.maxTemp,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomMoreDetailsItem(
                      icon: Icons.wind_power,
                      name: 'Wind',
                      unit: 'KM/H',
                      value: weatherModel.wind,
                    ),
                    CustomMoreDetailsItem(
                      icon: Icons.water_drop_rounded,
                      name: 'Humidity',
                      unit: '%',
                      value: weatherModel.humidity,
                    ),
                    CustomMoreDetailsItem(
                      icon: Icons.cloud,
                      name: 'Wind',
                      unit: '%',
                      value: weatherModel.cloud,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// DateTime convertStringToDateTime(String value) {
//   return DateTime.parse(value);
// }
