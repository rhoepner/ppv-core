import 'package:partner/src/value.dart';

enum Geschlecht with JsonName {
  maennlich("männlich"),
  weiblich("weiblich"),
  divers("divers"),
  unbekannt("unbekannt");

  static const String _jsonName = 'geschlecht';

  final String display;

  const Geschlecht(this.display);

  factory Geschlecht.fromString(String? value) {
    if (value is String) {
      try {
        return Geschlecht.values.byName(value);
      } catch (e) {
        // not there
      }
    }
    return unbekannt;
  }

  factory Geschlecht.fromJson(Map<String, dynamic> map) {
    var value = map[_jsonName];
    if (value is String) {
      return Geschlecht.fromString(value);
    }
    return unbekannt;
  }

  @override
  String jsonName() {
    return _jsonName;
  }
}
