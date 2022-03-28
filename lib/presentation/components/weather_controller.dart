import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather/weather_data.dart';
import 'package:weather_app/presentation/weather_page.dart';
import 'package:weather_app/providers/top_level_providers.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherController extends StateNotifier<AsyncValue<WeatherData>> {
  WeatherController(
    this._weatherRepository, {
    required this.city,
  }) : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }

  final HttpWeatherRepository _weatherRepository;
  final String city;

  Future<void> getWeather({required String city}) async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherRepository.getWeather(city);
      state = AsyncValue.data(WeatherData.from(weather));
    } catch (e) {
      print(e);
    }
  }
}

final currentWeatherControllerProvider =
    StateNotifierProvider.autoDispose<WeatherController, AsyncValue<WeatherData>>((ref) {
  final city = ref.watch(cityProvider);
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return WeatherController(weatherRepository, city: city);
});
