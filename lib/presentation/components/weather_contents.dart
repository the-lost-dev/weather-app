import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/presentation/weather_page.dart';
import 'package:weather_app/utils/utils.dart';

import 'components.dart';

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = weatherData.temp.celsius.toInt().toString();
    final wind = ((weatherData.windSpeed.toInt() * 18) / 5).toString();
    final humidity = weatherData.humidity.toString();
    return Column(
      children: [
        ForecastItem(
          date: weatherData.date,
          iconURL: weatherData.iconUrl,
          temp: temp + '\u00B0',
        ),
        WeatherIcon(iconURL: weatherData.iconUrl),
        Text(
          weatherData.description,
          style: Theme.of(context).textTheme.headline3,
        ),
        sizedBox6,
        Row(
          children: [
            TempDetail(
              title: Strings.temp,
              subTitle: temp + '\u00B0',
            ),
            TempDetail(
              title: Strings.wind,
              subTitle: wind + 'km/h',
            ),
            TempDetail(
              title: Strings.humidity,
              subTitle: humidity + '%',
            ),
          ],
        ),
      ],
    );
  }
}
