import 'package:flutter/material.dart';


import 'package:weather_app/services/get_weather_service.dart';


import 'package:weather_app/views/home_view.dart';


void main() {

  //WeatherService().getWeatherInfo();


  runApp(const WeatherApp());

}


class WeatherApp extends StatelessWidget {

  const WeatherApp({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    return const MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomeView(),

    );

  }

}

