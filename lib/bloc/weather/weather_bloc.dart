import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_tuto/network/api_service.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final ApiService apiService;

  WeatherBloc({@required this.apiService}): assert(apiService != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeather) {
      yield WeatherLoading();
      try {
        final response = await apiService.getWeather(event.cityId);
        yield WeatherLoaded(weatherModel: response);
      } on SocketException {
        yield WeatherError();
      } on Exception {
        yield WeatherError();
      }
    }
  }
}
