import 'package:weather_app/main.dart';

class WeatherModel {
  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String? image;
  final String date;
  final String currentCondition;

  WeatherModel({
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    this.image,
    required this.date,
    required this.currentCondition,
  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      minTemp:
          json["forecast"]['forecastday'][0]['day']['mintemp_c'].toDouble(),
      maxTemp:
          json["forecast"]['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      currentTemp: json["current"]['temp_c'].toDouble(),
      date: json['current']['last_updated'],
      currentCondition: json["current"]['condition']['text'],
      image: json["current"]['condition']['icon'],
    );
  }
}
