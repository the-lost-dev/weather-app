import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp();
  }
}
