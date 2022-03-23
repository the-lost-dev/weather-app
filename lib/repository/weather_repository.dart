import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/models.dart';

class HttpWeatherRepository {
  HttpWeatherRepository({
    required this.weatherAPI,
    required this.client,
  });

  final WeatherAPI weatherAPI;
  final http.Client client;

  /// CONVERSION METHODS FROM JSON TO USABLE DATA
  Future<WeatherModel> getWeather(String city) => _getData(
        uri: weatherAPI.weather(city),
        builder: (data) => WeatherModel.fromJson(data),
      );

    Future<ForecastModel> getForecast(String city) => _getData(
    uri: weatherAPI.weather(city),
    builder: (data) => ForecastModel.fromJson(data),
  );

  /// METHOD TO GET DATA FROM API
  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw "Invalid API Key";
        case 404:
          throw "City Not Found";
        default:
          throw "Some error Occurred";
      }
    } on SocketException catch (_) {
      throw "No Internet Connection";
    }
  }
}
