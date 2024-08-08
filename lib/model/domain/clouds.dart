class Clouds {
  Clouds({
    num? all,
  }) {
    _all = all;
  }

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }

  num? _all;

  Clouds copyWith({
    num? all,
  }) =>
      Clouds(
        all: all ?? _all,
      );

  num? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }
}
