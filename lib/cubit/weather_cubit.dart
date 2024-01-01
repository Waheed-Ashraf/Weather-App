import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeatherInfo(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(
        WeatherFailierState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
