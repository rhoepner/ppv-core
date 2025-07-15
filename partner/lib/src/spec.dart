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