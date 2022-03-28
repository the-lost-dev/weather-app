import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/models.dart';

import 'components.dart';

class ForecastWeatherContents extends ConsumerWidget {
  const ForecastWeatherContents({
    Key? key,
    required this.weatherDataItems,
  }) : super(key: key);

  final List<WeatherData> weatherDataItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: weatherDataItems.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => ForecastItem(
        date: weatherDataItems[index].date,
        iconURL: weatherDataItems[index].iconUrl,
        temp: weatherDataItems[index].temp.toString(),
      ),
    );
  }
}
