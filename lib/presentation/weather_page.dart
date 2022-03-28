import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/utils.dart';

import 'components/components.dart';

final cityProvider = StateProvider<String>((ref) => 'Dubai');

class WeatherPage extends ConsumerWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider);
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: mainPadding,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
              AppColors.utilityColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizedBox4,
              Text(
                city,
                style: Theme.of(context).textTheme.headline1,
              ),
              sizedBox6,
              weatherDataValue.when(
                data: (data) => CurrentWeatherContents(weatherData: data),
                loading: () => const CircularProgressIndicator(),
                error: (e, __) => Text(e.toString()),
              ),
              // ListView.builder(itemBuilder: itemBuilder),
              // ForecastItem(day: weatherDataValue.value.date.day, iconURL: iconURL, temp: temp)
            ],
          ),
        ),
      ),
    );
  }
}

class ForecastItem extends ConsumerWidget {
  const ForecastItem({
    Key? key,
    required this.date,
    required this.iconURL,
    required this.temp,
  }) : super(key: key);

  final DateTime date;
  final String iconURL;
  final String temp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: padding4,
      width: SizeConfig.blockSizeHorizontal * 40,
      height: SizeConfig.blockSizeVertical * 10,
      decoration: BoxDecoration(
        color: AppColors.weatherCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
           DateFormat.E().format(date),
            style: Theme.of(context).textTheme.headline3,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     WeatherIcon(iconURL: iconURL),
          //     Text(
          //       temp,
          //       style: Theme.of(context).textTheme.headline3,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
