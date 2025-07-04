abstract class Value<T> {
  T? _initial;
  T? _changed;

  String label();

  bool isAbsent() {
    return _initial == null;
  }

  T get value {
    if (_initial != null) {
      return _initial as T;
    }
    return absentValue();
  }

  set value(T value) {
    if (_initial == null) {
      _initial = value;
    } else {
      _changed = value;
    }
  }

  T absentValue();

  bool hasChanged() {
    return _changed != null;
  }

}

abstract class StringValue extends Value<String> {
  
  @override
  String absentValue() {
    return "";
  }
}
