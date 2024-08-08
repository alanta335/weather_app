class Wind {
  Wind({
    num? speed,
    num? deg,
    num? gust,
  }) {
    _speed = speed;
    _deg = deg;
    _gust = gust;
  }

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }

  num? _speed;
  num? _deg;
  num? _gust;

  Wind copyWith({
    num? speed,
    num? deg,
    num? gust,
  }) =>
      Wind(
        speed: speed ?? _speed,
        deg: deg ?? _deg,
        gust: gust ?? _gust,
      );

  num? get speed => _speed;

  num? get deg => _deg;

  num? get gust => _gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    map['gust'] = _gust;
    return map;
  }
}
