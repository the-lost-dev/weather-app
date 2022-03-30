import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/utils/utils.dart';

import 'components/components.dart';

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
          child: ListView(
            children: [
              sizedBox6,
              const CitySearchArea(),
              sizedBox8,
              Center(
                child: Text(
                  city,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              sizedBox6,
              weatherDataValue.when(
                data: (data) => CurrentWeatherContents(weatherData: data),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: strokeWidth,
                    color: AppColors.utilityColor,
                  ),
                ),
                error: (e, __) => Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              sizedBox14,
              Container(
                padding: horizontalPadding,
                height: SizeConfig.blockSizeVertical * 20,
                child: const ForecastWeatherRow(),
              ),
              sizedBox6,
            ],
          ),
        ),
      ),
    );
  }
}
