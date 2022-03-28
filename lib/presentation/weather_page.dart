import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                error: (e, __) => Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              sizedBox4,
              const ForecastWeatherRow()
            ],
          ),
        ),
      ),
    );
  }
}
