
import 'package:partner/src/value.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

class Partner {
  final Vorname vorname = Vorname();
  final Nachname nachname = Nachname();

  Partner();

  factory Partner.fromJson(Map<String, dynamic> data) {
    var result = Partner()
      ..vorname.fromJson(data)
      ..nachname.fromJson(data);
    return result;
  }  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    nachname.toJson(json);
    vorname.toJson(json);
    return json;
  }
  
}

class Vorname extends StringValue {

  @override
  String label() {
    return "Vorname";
  }
  
}

class Nachname extends StringValue {

  @override
  String label() {
    return "Nachname";
  }
  
}
