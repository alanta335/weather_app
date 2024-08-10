class LocalNames {
  LocalNames({
    String? ml,
    String? en,
  }) {
    _ml = ml;
    _en = en;
  }

  LocalNames.fromJson(dynamic json) {
    _ml = json['ml'];
    _en = json['en'];
  }

  String? _ml;
  String? _en;

  LocalNames copyWith({
    String? ml,
    String? en,
  }) =>
      LocalNames(
        ml: ml ?? _ml,
        en: en ?? _en,
      );

  String? get ml => _ml;

  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ml'] = _ml;
    map['en'] = _en;
    return map;
  }
}
