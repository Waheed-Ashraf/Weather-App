import 'package:weather_app/main.dart';

class WeatherModel {
  final String cityName;
  final String minTemp;
  final String maxTemp;
  final String currentTemp;
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
  factory WeatherModel.fromjson(json) {
  return  WeatherModel(
      cityName:json ['location']['country'],
      minTemp:json ["forecast"]['forecastday']['0']['day']['mintemp_c'],
      maxTemp:json ["forecast"]['forecastday']['0']['day']['maxtemp_c'],
      currentTemp:json ['current']['temp_c'],
      date:json ['current']['last_update'],
      currentCondition:json  ['current']["condition"]['text'],
    );
  }
}
