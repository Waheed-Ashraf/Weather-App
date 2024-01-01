import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:weather_app/cubit/weather_cubit.dart';


import 'package:weather_app/cubit/weather_states.dart';


import 'package:weather_app/services/get_weather_service.dart';


import 'package:weather_app/views/home_view.dart';


void main() {

  runApp(const WeatherApp());

}


class WeatherApp extends StatelessWidget {

  const WeatherApp({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    return BlocProvider(

        create: (context) => GetWeatherCubit(),

        child: Builder(

          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(

            builder: (context, state) {

              return MaterialApp(

                debugShowCheckedModeBanner: false,

                theme: ThemeData(

                  appBarTheme: AppBarTheme(

                    backgroundColor: getColorForCondition(

                        BlocProvider.of<GetWeatherCubit>(context)

                            .weatherModel

                            ?.currentCondition

                            .toLowerCase()),

                  ),

                ),

                home: HomeView(),

              );

            },

          ),

        ));

  }

}


// instead of using builder widget you can extract th materialApp


//so the context will chang


// class CustomMaterialApp extends StatelessWidget {


//   const CustomMaterialApp({


//     super.key,


//   });


//   @override


//   Widget build(BuildContext context) {


//     return MaterialApp(


//       debugShowCheckedModeBanner: false,


//       theme: ThemeData(


//         appBarTheme: AppBarTheme(


//           backgroundColor: getColorForCondition(


//             BlocProvider.of<GetWeatherCubit>(context)


//                 .weatherModel


//                 ?.currentCondition,


//           ),


//         ),


//       ),


//       home: HomeView(),


//     );


//   }


// }


MaterialColor getColorForCondition(String? condition) {

  if (condition == null) {

    return Colors.orange;

  } else {

    switch (condition) {

      case 'sunny':

        return Colors.amber;


      case 'partly cloudy':

        return Colors.indigo;


      case 'cloudy':

      case 'overcast':

      case 'mist':

      case 'fog':

      case 'freezing fog':

        return Colors.grey;


      case 'patchy rain possible':

      case 'patchy snow possible':

      case 'patchy sleet possible':

      case 'patchy freezing drizzle possible':

      case 'patchy light drizzle':

      case 'light drizzle':

      case 'freezing drizzle':

      case 'light rain shower':

      case 'light sleet showers':

      case 'light snow showers':

      case 'light showers of ice pellets':

        return Colors.lightBlue;


      case 'thundery outbreaks possible':

      case 'patchy heavy snow':

      case 'heavy snow':

      case 'torrential rain shower':

      case 'moderate or heavy snow showers':

      case 'moderate or heavy showers of ice pellets':

      case 'blowing snow':

        return Colors.blue;


      case 'blizzard':

      case 'clear':

        return Colors.blueGrey;


      case 'moderate rain at times':

      case 'moderate rain':

      case 'heavy rain at times':

      case 'heavy rain':

      case 'moderate or heavy freezing rain':

      case 'moderate or heavy sleet':

      case 'moderate or heavy rain shower':

        return Colors.red;


      case 'patchy light snow':

      case 'light snow':

      case 'patchy moderate snow':

      case 'moderate snow':

      case 'patchy light rain with thunder':

      case 'moderate or heavy rain with thunder':

      case 'patchy light snow with thunder':

      case 'moderate or heavy snow with thunder':

      case 'ice pellets':

        return Colors.deepPurple;


      default:

        return Colors.teal;

    }

  }

}

