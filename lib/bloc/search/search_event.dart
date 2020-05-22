import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchCity extends SearchEvent {

  final String keyword;

  const FetchCity({@required this.keyword}): assert(keyword != null);


  @override
  // TODO: implement props
  List<Object> get props => [keyword];

}
