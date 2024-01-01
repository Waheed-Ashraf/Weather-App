import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherFailierState extends WeatherState {
  String errorMessage;
  WeatherFailierState({required this.errorMessage});
}
