import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:weather_app/cubit/weather_cubit.dart';


import 'package:weather_app/cubit/weather_states.dart';


import 'package:weather_app/main.dart';


import 'package:weather_app/models/weather_model.dart';


import 'package:weather_app/views/search_view.dart';


import 'package:weather_app/widgets/no_weather_body.dart';


import 'package:weather_app/widgets/weather_info_body.dart';


class HomeView extends StatelessWidget {

  const HomeView({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) => const SearchView(),

                ),

              );

            },

            icon: const Icon(Icons.search_outlined),

          ),

        ],

        title: const Text('Weather App'),

      ),

      body: BlocBuilder<GetWeatherCubit, WeatherState>(

        builder: (context, state) {

          if (state is WeatherInitialState) {

            return NoWeatherBody();

          } else if (state is WeatherLoadedState) {

            return WeatherInfoBody(

              weatherModel: state.weatherModel,

            );

          } else {

            return const Center(

              child: Text('oops there is an Error Please try again later..'),

            );

          }

        },

      ),

    );

  }

}

