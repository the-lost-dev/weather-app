
import 'package:weather_app/models/models.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherData {
  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherData.from(WeatherModel weatherModel) {
    return WeatherData(
      temp: Temperature.celsius(weatherModel.main.temp),
      minTemp: Temperature.celsius(weatherModel.main.temp_min),
      maxTemp: Temperature.celsius(weatherModel.main.temp_max),
      description: weatherModel.weather[0].description,
      date: DateTime.fromMillisecondsSinceEpoch(weatherModel.dt * 1000),
      icon: weatherModel.weather[0].icon,
      humidity: weatherModel.main.humidity,
      windSpeed: weatherModel.wind.speed,
    );
  }

  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final int humidity;
  final double windSpeed;
  final String icon;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
}
