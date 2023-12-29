import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "3e021a1ab43b4724ab6134906232812";
  var dio = Dio();
  Future<WeatherModel> getWeatherInfo({required String cityName}) async {
    try {
      var response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName',
      );
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          "ooops there was an error, please try again later";
      throw Exception(errorMessage);
    } catch (e) {
      // log(int.parse(e.toString()));
      throw Exception("ooops there was an error, please try again later");
    }
  }
}
