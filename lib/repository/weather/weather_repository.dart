import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/config/constant/constant.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/model/dto/current_weather_dto.dart';

part 'weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepository();
}

class WeatherRepository {
  final dio = Dio();

  Future<Either<AppFailure, CurrentWeatherDto>> getCurrentWeather(
      {required String lat, required String lon}) async {
    try {
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${Constant.WEATHER_API}');
      CurrentWeatherDto currentWeather =
          CurrentWeatherDto.fromJson(response.data);
      if (response.statusCode != HttpStatus.ok) {
        return Left(AppFailure());
      }
      return Right(currentWeather);
    } on Exception catch (e) {
      return Left(
          AppFailure("Error occured during signup APi call ${e.toString()}"));
    }
  }
}
