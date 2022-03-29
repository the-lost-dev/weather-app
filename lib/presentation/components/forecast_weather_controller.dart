import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/forecast/forecast_data.dart';
import 'package:weather_app/presentation/weather_page.dart';
import 'package:weather_app/providers/top_level_providers.dart';
import 'package:weather_app/repository/weather_repository.dart';

class ForecastWeatherController
    extends StateNotifier<AsyncValue<ForecastData>> {
  ForecastWeatherController(
    this._weatherRepository, {
    required this.city,
  }) : super(const AsyncValue.loading()) {
    getWeatherForecast(city: city);
  }

  final HttpWeatherRepository _weatherRepository;
  final String city;

  Future<void> getWeatherForecast({required String city}) async {
    try {
      state = const AsyncValue.loading();
      final weatherForecast = await _weatherRepository.getForecast(city);
      state = AsyncValue.data(ForecastData.from(weatherForecast));
    } catch (e) {
      e;
    }
  }
}

final forecastWeatherControllerProvider = StateNotifierProvider.autoDispose<
    ForecastWeatherController, AsyncValue<ForecastData>>(((ref) {
  final city = ref.watch(cityProvider);
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return ForecastWeatherController(weatherRepository, city: city);
}));
