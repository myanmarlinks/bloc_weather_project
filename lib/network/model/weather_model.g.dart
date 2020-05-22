// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    json['title'] as String,
    json['location_type'] as String,
    json['woeid'] as int,
    json['timezone'] as String,
    (json['consolidated_weather'] as List)
        ?.map((e) =>
            e == null ? null : StateModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeId,
      'timezone': instance.timeZone,
      'consolidated_weather': instance.weatherStates,
    };
