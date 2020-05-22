import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final int cityId;

  const FetchWeather({@required this.cityId}): assert(cityId != null);

  @override
  List<Object> get props => [cityId];
}
