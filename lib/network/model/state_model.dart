import 'package:json_annotation/json_annotation.dart';


part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: "weather_state_name")
  final String weatherStateName;
  @JsonKey(name: "weather_state_abbr")
  final String weatherStateAbbr;
  final String created;
  @JsonKey(name: "min_temp")
  final double minTemp;
  @JsonKey(name: "max_temp")
  final double maxTemp;
  @JsonKey(name: "the_temp")
  final double theTemp;
  final int humidity;

  StateModel(this.weatherStateName, this.weatherStateAbbr, this.created,
      this.minTemp, this.maxTemp, this.theTemp, this.humidity);

  factory StateModel.fromJson(Map<String, dynamic> json) => _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);

}