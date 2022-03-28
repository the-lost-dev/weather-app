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
        final forecastDays = [0, 8, 16, 24, 32];
        return ForecastWeatherContents(
          weatherDataItems: [
            for (var i in forecastDays) forecastData.list[i],
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, __) => Text(
        e.toString(),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
