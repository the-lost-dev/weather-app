import 'package:weather_app/models/models.dart';

class ForecastData {
  const ForecastData({
    required this.list,
  });

  final List<WeatherData> list;

  factory ForecastData.from(ForecastModel forecastModel) => ForecastData(
        list: forecastModel.list.map((data) => WeatherData.from(data)).toList(),
      );
}
