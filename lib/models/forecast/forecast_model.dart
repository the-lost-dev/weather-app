import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/models.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  const ForecastModel({
    required this.list,
  });

  final List<WeatherModel> list;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}
