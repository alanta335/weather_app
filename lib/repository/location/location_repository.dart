import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/config/constant/constant.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/model/dto/location_details_dto.dart';

part 'location_repository.g.dart';

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepository();
}

class LocationRepository {
  final dio = Dio();

  Future<Either<AppFailure, List<LocationDetailsDto>>> getLocationDetails(
      {required String locationName}) async {
    try {
      final response = await dio.get(
          'http://api.openweathermap.org/geo/1.0/direct?q=$locationName&limit=4&appid=${Constant.WEATHER_API}');
      // Ensure the response data is treated as a list
      List<dynamic> data = response.data as List<dynamic>;

      // Convert each JSON object in the list to a LocationDetailsDto object
      List<LocationDetailsDto> locationDetails =
          data.map((json) => LocationDetailsDto.fromJson(json)).toList();

      if (response.statusCode != HttpStatus.ok) {
        return Left(AppFailure());
      }
      return Right(locationDetails);
    } on Exception catch (e) {
      return Left(AppFailure(
          "Error occured during location data APi call ${e.toString()}"));
    }
  }
}
