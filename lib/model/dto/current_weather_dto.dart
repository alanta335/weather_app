import 'package:weather_app/model/domain/clouds.dart';
import 'package:weather_app/model/domain/main.dart';
import 'package:weather_app/model/domain/weather.dart';
import 'package:weather_app/model/domain/wind.dart';

class CurrentWeatherDto {
  CurrentWeatherDto({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) {
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  CurrentWeatherDto.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  num? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  num? _dt;
  Sys? _sys;
  num? _timezone;
  num? _id;
  String? _name;
  num? _cod;

  CurrentWeatherDto copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) =>
      CurrentWeatherDto(
        coord: coord ?? _coord,
        weather: weather ?? _weather,
        base: base ?? _base,
        main: main ?? _main,
        visibility: visibility ?? _visibility,
        wind: wind ?? _wind,
        clouds: clouds ?? _clouds,
        dt: dt ?? _dt,
        sys: sys ?? _sys,
        timezone: timezone ?? _timezone,
        id: id ?? _id,
        name: name ?? _name,
        cod: cod ?? _cod,
      );

  Coord? get coord => _coord;

  List<Weather>? get weather => _weather;

  String? get base => _base;

  Main? get main => _main;

  num? get visibility => _visibility;

  Wind? get wind => _wind;

  Clouds? get clouds => _clouds;

  num? get dt => _dt;

  Sys? get sys => _sys;

  num? get timezone => _timezone;

  num? get id => _id;

  String? get name => _name;

  num? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }
}

class Sys {
  Sys({
    String? country,
    num? sunrise,
    num? sunset,
  }) {
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  String? _country;
  num? _sunrise;
  num? _sunset;

  Sys copyWith({
    String? country,
    num? sunrise,
    num? sunset,
  }) =>
      Sys(
        country: country ?? _country,
        sunrise: sunrise ?? _sunrise,
        sunset: sunset ?? _sunset,
      );

  String? get country => _country;

  num? get sunrise => _sunrise;

  num? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }
}

class Coord {
  Coord({
    num? lon,
    num? lat,
  }) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  num? _lon;
  num? _lat;

  Coord copyWith({
    num? lon,
    num? lat,
  }) =>
      Coord(
        lon: lon ?? _lon,
        lat: lat ?? _lat,
      );

  num? get lon => _lon;

  num? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}
