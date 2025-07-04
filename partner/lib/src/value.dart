abstract class Value<T> {
  T? _initial;
  T? _changed;

  String label();
  String jsonName() {
    return label().toLowerCase();
  }

  bool isAbsent() {
    return _initial == null;
  }

  bool isPresent() {
    return _initial != null;
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

  void toJson(Map<String, dynamic> json) {
    if (isPresent()) {
      json[jsonName()] = value;
    } 
  }

  void fromJson(Map<String, dynamic> json);

}

abstract class StringValue extends Value<String> {
  
  @override
  String absentValue() {
    return "";
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    if (json.containsKey(jsonName())) {
      var jsonValue = json[jsonName()];
      if (jsonValue is String)   {
        value = jsonValue;
      } 
    }
  }
}
