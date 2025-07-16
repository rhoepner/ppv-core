class StringValueSpec {
  final String name;

  const StringValueSpec(this.name);

  String mut(String currentValue, String? newValue, Map<String,dynamic> delta)  {
    if (newValue != null) {
      if (currentValue != newValue) {
        delta[name] = newValue;
        return newValue;
      }
    }
    return currentValue;
  }

}

class EnumValueSpec<T extends Enum> {
  final String name;

  const EnumValueSpec(this.name);

  T mut(T currentValue, T? newValue, Map<String,dynamic> delta)  {
    if (newValue != null) {
      if (currentValue != newValue) {
        delta[name] = newValue;
        return newValue;
      }
    }
    return currentValue;
  }

}