import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_tuto/network/model/city_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class CityEmpty extends SearchState {}

class CityLoading extends SearchState {}

class CityLoaded extends SearchState {
  final List<CityModel> cityModels;
  const CityLoaded({@required this.cityModels}): assert(cityModels != null);
}
class CityNotLoaded extends SearchState {}
class CityError extends SearchState {}
