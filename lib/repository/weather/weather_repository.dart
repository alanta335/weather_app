import 'package:dio/dio.dart';
import 'package:weather_app/core/config/constant/constant.dart';
import 'package:weather_app/model/dto/current_weather_dto.dart';

class WeatherRepository {
  final dio = Dio();

  Future<CurrentWeatherDto> getCurrentWeather(
      {required String lat, required String lon}) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${Constant.WEATHER_API}');
    CurrentWeatherDto currentWeather =
        CurrentWeatherDto.fromJson(response.data);
    return currentWeather;
  }
}
