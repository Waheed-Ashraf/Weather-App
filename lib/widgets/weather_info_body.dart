import 'package:flutter/material.dart';


import 'package:weather_app/main.dart';


import 'package:weather_app/models/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {

  WeatherInfoBody({super.key, required this.weatherModel});


  final WeatherModel weatherModel;


  @override

  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        gradient: LinearGradient(colors: [

          getColorForCondition(weatherModel.currentCondition.toLowerCase()),

          Colors.white,

        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),

      ),

      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(

              weatherModel.cityName,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 32,

              ),

            ),

            Text(

              'updated at ${weatherModel.date.hour.toString()}:${weatherModel.date.minute.toString()}',

              style: const TextStyle(

                fontSize: 24,

              ),

            ),

            const SizedBox(

              height: 32,

            ),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  SizedBox(

                    height: 100,

                    width: 100,

                    child: Image.network(

                      'https:${weatherModel.image}',

                    ),

                  ),

                  Text(

                    "${weatherModel.currentTemp.round()}",

                    style: const TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 32,

                    ),

                  ),

                  Center(

                    child: Column(

                      children: [

                        Text(

                          'Maxtemp: ${weatherModel.maxTemp.round()}',

                          style: const TextStyle(

                            fontSize: 16,

                          ),

                        ),

                        Text(

                          'Mintemp: ${weatherModel.minTemp.round()}',

                          style: const TextStyle(

                            fontSize: 16,

                          ),

                        ),

                      ],

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(

              height: 32,

            ),

            Text(

              weatherModel.currentCondition,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 32,

              ),

            ),

          ],

        ),

      ),

    );

  }

}

