
import 'package:partner/src/value.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

class Partner {
  final Vorname vorname = Vorname();
  final Nachname nachname = Nachname();

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
