import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/presentation/weather_page.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
