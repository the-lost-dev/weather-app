// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';




@JsonSerializable()
class WeatherModel {

  WeatherModel({required this.main, required this.weather, required this.wind, required this.dt,});

  final TempParams main;
  final List<WeatherInfo> weather;
  final WindParam wind;
  final int dt;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);


}

@JsonSerializable()
class WindParam{
  const WindParam({
    required this.speed,
  });
final double speed;
factory WindParam.fromJson(Map<String, dynamic> json) => _$WindParamFromJson(json);
}

@JsonSerializable()
class TempParams {

  const TempParams({
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
  });

  final double temp;
  final double temp_min;
  final double temp_max;
  final int humidity;

  factory TempParams.fromJson(Map<String, dynamic> json) => _$TempParamsFromJson(json);

}

@JsonSerializable()
class WeatherInfo {
  const WeatherInfo({
    required this.main,
    required this.description,
    required this.icon,
  });

  final String main;
  final String description;
  final String icon;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => _$WeatherInfoFromJson(json);
}