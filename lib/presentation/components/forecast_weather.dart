import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components.dart';

class ForecastWeatherRow extends ConsumerWidget {
  const ForecastWeatherRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(forecastWeatherControllerProvider);
    return forecastDataValue.when(
      data: (forecastData) {
        print(forecastData);
        return Text(forecastData.list.toString());
        // final forecastDays = [0, 8, 16, 24, 32];
        // print(forecastData.list.length);
        // return ForecastWeatherContents(
        //   weatherDataItems: forecastData.list,
        // );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, __) => Text(
        e.toString(),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
