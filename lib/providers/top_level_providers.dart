import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/repository/weather_repository.dart';

final weatherRepositoryProvider = Provider<HttpWeatherRepository>((ref) {
  const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: APIKEY.openWeatherMapApiKey,
  );
  return HttpWeatherRepository(
    weatherAPI: WeatherAPI(apiKey),
    client: http.Client(),
  );
});
