import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_tuto/bloc/weather/bloc.dart';
import 'package:weather_tuto/helpers/my_helper.dart';
import 'package:weather_tuto/network/model/weather_condition.dart';
import 'package:weather_tuto/ui/search_area.dart';

class WeatherHome extends StatefulWidget {
  final int cityId;
  WeatherHome({this.cityId = 1015662});
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {

  final newFormat = DateFormat("dd/MM/yy H:m:s");
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc..add(FetchWeather(cityId: widget.cityId));
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.home),
            title: const Text("Weather"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Show Search',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchArea()));
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if(state is WeatherLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is WeatherLoaded) {
                  final dateCreated = newFormat.format(DateTime.parse(state.weatherModel.weatherStates[0].created));
                  final WeatherCondition weatherCondition = MyHelper.mapStringToWeatherCondition(state.weatherModel.weatherStates[0].weatherStateAbbr);
                  String weatherImage;
                  switch(weatherCondition) {
                    case WeatherCondition.clear:
                      weatherImage = "clear";
                      break;
                    case WeatherCondition.lightCloud:
                      weatherImage = "cloudy";
                      break;
                    case WeatherCondition.heavyCloud:
                      weatherImage = "heavycloud";
                      break;
                    case WeatherCondition.lightRain:
                      weatherImage = "lightrain";
                      break;
                    case WeatherCondition.heavyRain:
                      weatherImage = "rainy";
                      break;
                    case WeatherCondition.snow:
                      weatherImage = "snow";
                      break;
                    case WeatherCondition.thunderstorm:
                      weatherImage = "thunderstorm";
                      break;
                      default:
                        weatherImage = "clear";
                        break;
                  }
                  return ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "${state.weatherModel.title.toUpperCase()}",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                                textStyle: Theme.of(context).textTheme.headline2),
                          ),
                          Text(
                            "updated: $dateCreated",
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Image(
                              width: 150.0,
                                image: AssetImage("assets/images/$weatherImage.png")
                            ),
                          ),
                          Text(
                              "${state.weatherModel.weatherStates[0].weatherStateName.toUpperCase()}",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                              textStyle: Theme.of(context).textTheme.headline5
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "${state.weatherModel.weatherStates[0].theTemp.toInt()}°C",
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.headline3,
                                  color: Colors.red
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text("min: ${state.weatherModel.weatherStates[0].minTemp.toInt()}°C"),
                                  Text("max: ${state.weatherModel.weatherStates[0].maxTemp.toInt()}°C")
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                }
                return null;
              },
            )
          )
      ),
    );
  }
}
