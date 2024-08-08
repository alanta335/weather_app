class Main {
  Main({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
  }) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }

  num? _temp;
  num? _feelsLike;
  num? _tempMin;
  num? _tempMax;
  num? _pressure;
  num? _humidity;

  Main copyWith({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
  }) =>
      Main(
        temp: temp ?? _temp,
        feelsLike: feelsLike ?? _feelsLike,
        tempMin: tempMin ?? _tempMin,
        tempMax: tempMax ?? _tempMax,
        pressure: pressure ?? _pressure,
        humidity: humidity ?? _humidity,
      );

  num? get temp => _temp;

  num? get feelsLike => _feelsLike;

  num? get tempMin => _tempMin;

  num? get tempMax => _tempMax;

  num? get pressure => _pressure;

  num? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    return map;
  }
}
