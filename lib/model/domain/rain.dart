class Rain {
  Rain({
    num? h,
  }) {
    _h = h;
  }

  Rain.fromJson(dynamic json) {
    _h = json['1h'];
  }

  num? _h;

  Rain copyWith({
    num? h,
  }) =>
      Rain(
        h: h ?? _h,
      );

  num? get h => _h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['1h'] = _h;
    return map;
  }
}
