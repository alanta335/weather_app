// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchViewmodelHash() => r'b3995b5191afecb43970e1b8f0657a9d2197abeb';

/// See also [SearchViewmodel].
@ProviderFor(SearchViewmodel)
final searchViewmodelProvider = AutoDisposeAsyncNotifierProvider<
    SearchViewmodel, CurrentWeatherModel?>.internal(
  SearchViewmodel.new,
  name: r'searchViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchViewmodel = AutoDisposeAsyncNotifier<CurrentWeatherModel?>;
String _$suggestionsHash() => r'5df14a3abe6194a12d9d81c1a61cdb15fe6fd33e';

/// See also [Suggestions].
@ProviderFor(Suggestions)
final suggestionsProvider = AutoDisposeNotifierProvider<Suggestions,
    List<LocationDetailsModel>>.internal(
  Suggestions.new,
  name: r'suggestionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$suggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Suggestions = AutoDisposeNotifier<List<LocationDetailsModel>>;
String _$locationSearchTextHash() =>
    r'cacd73dced2a8ff361c5b300ab7d045fa7d76ccd';

/// See also [LocationSearchText].
@ProviderFor(LocationSearchText)
final locationSearchTextProvider = AutoDisposeNotifierProvider<
    LocationSearchText, LocationDetailsModel?>.internal(
  LocationSearchText.new,
  name: r'locationSearchTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationSearchTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationSearchText = AutoDisposeNotifier<LocationDetailsModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
