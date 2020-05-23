import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_tuto/bloc/search/bloc.dart';
import 'package:weather_tuto/bloc/weather/bloc.dart';
import 'package:weather_tuto/helpers/simple_bloc_delegate.dart';
import 'package:weather_tuto/network/api_service.dart';
import 'package:weather_tuto/ui/weather_home.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const String _title = "Weather App";

  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc(apiService: apiService),
              ),
              BlocProvider<SearchBloc>(
                create: (context) => SearchBloc(apiService: apiService),
              )
            ],
            child: MaterialApp(
              title: _title,
              home: WeatherHome(),
            ),
          );
        },
      )
    );
  }
}
