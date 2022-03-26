import 'package:flutter/material.dart';
import 'package:weather_app/presentation/weather_page.dart';
import 'package:weather_app/utils/utils.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WeatherTheme.weatherTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const WeatherPage(),
    );
  }
}
