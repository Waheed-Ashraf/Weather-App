import 'package:flutter/material.dart';


class NoWeatherBody extends StatelessWidget {

  NoWeatherBody({

    Key? key,

  }) : super(key: key);


  @override

  Widget build(BuildContext context) {

    return Padding(

      padding: EdgeInsets.symmetric(horizontal: 16),

      child: Center(

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            SizedBox(

              width: 150,

              height: 150,

              child: Image.asset("assets/images/search.png"),

            ),

            const Text(

              'Searching for weather now',

              style: TextStyle(

                fontSize: 20,

              ),

            )

          ],

        ),

      ),

    );

  }

}

