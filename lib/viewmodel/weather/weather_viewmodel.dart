import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/model/domain/current_weather_model.dart';
import 'package:weather_app/repository/weather/weather_repository.dart';

part 'weather_viewmodel.g.dart';

@riverpod
class WeatherViewmodel extends _$WeatherViewmodel {
  late WeatherRepository _weatherRepository;

  @override
  AsyncValue<CurrentWeatherModel>? build() {
    _weatherRepository = ref.watch(weatherRepositoryProvider);
    return null;
  }

  Future<AsyncValue<CurrentWeatherModel>> currentWeather(
      {required String lat, required String lon}) async {
    state = const AsyncValue.loading();
    final response =
        await _weatherRepository.getCurrentWeather(lat: lat, lon: lon);
    return response.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (r) => state = AsyncValue.data(
        CurrentWeatherModel(
          weather: r.weather,
          main: r.main,
          name: r.name,
        ),
      ),
    );
  }
}
