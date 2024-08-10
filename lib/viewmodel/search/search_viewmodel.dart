import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/model/domain/current_weather_model.dart';
import 'package:weather_app/model/domain/location_details_model.dart';
import 'package:weather_app/repository/location/location_repository.dart';
import 'package:weather_app/repository/weather/weather_repository.dart';

part 'search_viewmodel.g.dart';

@riverpod
class SearchViewmodel extends _$SearchViewmodel {
  late WeatherRepository _weatherRepository;

  @override
  AsyncValue<CurrentWeatherModel?> build() {
    _weatherRepository = ref.watch(weatherRepositoryProvider);
    return const AsyncValue.data(null);
  }

  Future<void> fetchLocationWeather(
      {required String lat, required String lon}) async {
    state = const AsyncValue.loading();
    try {
      final response = await getWeatherFromLatLon(lat: lat, lon: lon);
      state = response.fold(
        (l) => throw Exception(l.message),
        (r) => AsyncValue.data(r),
      );
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<Either<AppFailure, CurrentWeatherModel>> getWeatherFromLatLon(
      {required String lat, required String lon}) async {
    final response =
        await _weatherRepository.getCurrentWeather(lat: lat, lon: lon);
    return response.map((r) {
      CurrentWeatherModel weather = CurrentWeatherModel(
        weather: r.weather,
        main: r.main,
        name: r.name,
        wind: r.wind,
        clouds: r.clouds,
        visibility: r.visibility,
      );
      return weather;
    });
  }
}

@riverpod
class Suggestions extends _$Suggestions {
  late LocationRepository _locationRepository;

  @override
  List<LocationDetailsModel> build() {
    _locationRepository = ref.watch(locationRepositoryProvider);
    return [];
  }

  Future<void> updateSuggestions({required String? location}) async {
    state = location == null
        ? []
        : await fetchLocationSuggetions(location: location);
  }

  Future<List<LocationDetailsModel>> fetchLocationSuggetions(
      {required String location}) async {
    try {
      final result =
          await _locationRepository.getLocationDetails(locationName: location);
      return result.fold((l) {
        return [];
      },
          (r) => r
              .map((_) => LocationDetailsModel(
                    name: _.name,
                    country: _.country,
                    lat: _.lat,
                    lon: _.lon,
                    localNames: _.localNames,
                    state: _.state,
                  ))
              .toList());
    } on Exception catch (e) {}
    return [];
  }
}

@riverpod
class LocationSearchText extends _$LocationSearchText {
  @override
  LocationDetailsModel? build() {
    return null;
  }

  void update(LocationDetailsModel value) {
    state = value;
  }
}
