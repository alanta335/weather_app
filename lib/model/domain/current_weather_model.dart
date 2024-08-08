import 'package:weather_app/model/domain/clouds.dart';
import 'package:weather_app/model/domain/main.dart';
import 'package:weather_app/model/domain/rain.dart';
import 'package:weather_app/model/domain/weather.dart';
import 'package:weather_app/model/domain/wind.dart';

class CurrentWeatherModel {
  CurrentWeatherModel({
    List<Weather>? weather,
    Main? main,
    num? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) {
    _weather = weather;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _rain = rain;
    _clouds = clouds;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  CurrentWeatherModel.fromJson(dynamic json) {
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  List<Weather>? _weather;
  Main? _main;
  num? _visibility;
  Wind? _wind;
  Rain? _rain;
  Clouds? _clouds;
  num? _timezone;
  num? _id;
  String? _name;
  num? _cod;

  CurrentWeatherModel copyWith({
    List<Weather>? weather,
    Main? main,
    num? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) =>
      CurrentWeatherModel(
        weather: weather ?? _weather,
        main: main ?? _main,
        visibility: visibility ?? _visibility,
        wind: wind ?? _wind,
        rain: rain ?? _rain,
        clouds: clouds ?? _clouds,
        timezone: timezone ?? _timezone,
        id: id ?? _id,
        name: name ?? _name,
        cod: cod ?? _cod,
      );

  List<Weather>? get weather => _weather;

  Main? get main => _main;

  num? get visibility => _visibility;

  Wind? get wind => _wind;

  Rain? get rain => _rain;

  Clouds? get clouds => _clouds;

  num? get timezone => _timezone;

  num? get id => _id;

  String? get name => _name;

  num? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_rain != null) {
      map['rain'] = _rain?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }
}
