import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/model/domain/current_weather_model.dart';
import 'package:weather_app/model/domain/location_details_model.dart';
import 'package:weather_app/repository/location/location_repository.dart';

part 'search_viewmodel.g.dart';

@riverpod
class SearchViewmodel extends _$SearchViewmodel {
  @override
  Future<CurrentWeatherModel?> build() async {
    return null;
  }

  Future<void> getCurrentWeather({required String locationName}) async {
    state = const AsyncValue.loading();
    try {} on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
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
