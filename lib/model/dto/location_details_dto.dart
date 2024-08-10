import 'package:weather_app/model/domain/local_name.dart';

class LocationDetailsDto {
  LocationDetailsDto({
    String? name,
    LocalNames? localNames,
    num? lat,
    num? lon,
    String? country,
    String? state,
  }) {
    _name = name;
    _localNames = localNames;
    _lat = lat;
    _lon = lon;
    _country = country;
    _state = state;
  }

  LocationDetailsDto.fromJson(dynamic json) {
    _name = json['name'];
    _localNames = json['local_names'] != null
        ? LocalNames.fromJson(json['local_names'])
        : null;
    _lat = json['lat'];
    _lon = json['lon'];
    _country = json['country'];
    _state = json['state'];
  }

  String? _name;
  LocalNames? _localNames;
  num? _lat;
  num? _lon;
  String? _country;
  String? _state;

  LocationDetailsDto copyWith({
    String? name,
    LocalNames? localNames,
    num? lat,
    num? lon,
    String? country,
    String? state,
  }) =>
      LocationDetailsDto(
        name: name ?? _name,
        localNames: localNames ?? _localNames,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        country: country ?? _country,
        state: state ?? _state,
      );

  String? get name => _name;

  LocalNames? get localNames => _localNames;

  num? get lat => _lat;

  num? get lon => _lon;

  String? get country => _country;

  String? get state => _state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_localNames != null) {
      map['local_names'] = _localNames?.toJson();
    }
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['country'] = _country;
    map['state'] = _state;
    return map;
  }
}
