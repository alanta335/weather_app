import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/failure/app_failure.dart';
import 'package:weather_app/model/domain/current_weather_model.dart';
import 'package:weather_app/repository/weather/weather_repository.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  late WeatherRepository _weatherRepository;

  @override
  Future<CurrentWeatherModel> build() async {
    _weatherRepository = ref.watch(weatherRepositoryProvider);
    try {
      final Position position = await _determinePosition();
      final response = await currentWeather(
          lat: position.latitude.toString(),
          lon: position.longitude.toString());
      return response.fold(
        (l) => throw Exception(l.message),
        (r) => r,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<Either<AppFailure, CurrentWeatherModel>> currentWeather(
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

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
