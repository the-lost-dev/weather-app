import 'package:weather_app/models/models.dart';

class ForecastData {
  const ForecastData({
    required this.list,
  });

  final List<WeatherData> list;

  factory ForecastData.from(ForecastModel forecastModel) {
    return ForecastData(
      list: forecastModel.list.map((data) {
        print(forecastModel.list.length);
        return WeatherData.from(data);
      }).toList(),
    );
  }
}
