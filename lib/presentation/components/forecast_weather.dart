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
        for ()
      },
      error: error,
      loading: loading,
    );
  }
}
