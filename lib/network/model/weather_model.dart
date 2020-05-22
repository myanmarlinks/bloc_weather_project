
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_tuto/network/model/state_model.dart';
import 'package:weather_tuto/network/model/weather_condition.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {

  @override
  List<Object> get props => [
    title,
    locationType,
    woeId,
    timeZone,
    weatherStates
  ];

  final String title;
  @JsonKey(name: "location_type")
  final String locationType;
  @JsonKey(name: "woeid")
  final int woeId;
  @JsonKey(name: "timezone")
  final String timeZone;
  @JsonKey(name: "consolidated_weather")
  final List<StateModel> weatherStates;

  WeatherModel(this.title, this.locationType, this.woeId, this.timeZone,
      this.weatherStates);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

}