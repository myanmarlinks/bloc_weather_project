import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_tuto/network/api_service.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService apiService;

  SearchBloc({@required this.apiService}): assert(apiService != null);

  @override
  SearchState get initialState => CityEmpty();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if(event is FetchCity) {
      yield CityLoading();
      try {
        final response = await apiService.getCities(event.keyword);
        if(response.length == 0) {
          yield CityNotLoaded();
        } else {
          yield CityLoaded(cityModels: response);
        }
      } on SocketException {
        yield CityError();
      } on Exception {
        yield CityError();
      }
    }
  }
}
