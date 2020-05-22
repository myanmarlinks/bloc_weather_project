import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_tuto/network/model/models.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://www.metaweather.com/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("location/{locationId}")
  Future<WeatherModel> getWeather(@Path() int locationId);

  @GET("location/search/")
  Future<List<CityModel>> getCities(@Query("query") String keyword);
}