import 'package:flutter/material.dart';


import 'package:weather_app/views/search_view.dart';


import 'package:weather_app/widgets/no_weather_body.dart';


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

      body: const NoWeatherBody(),

    );

  }

}

