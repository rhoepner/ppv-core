import 'package:partner/src/value.dart';

/// Encapsulated Identifier of an Aggregate.
/// 
/// Like all Values(s), an AggregateId may be absent indicating 
/// that an Aggregate has not been persistet yet, hence is new.
class AggregateId extends StringValue {

  @override
  String label() {
    return "Identifier";
  }

  @override
  String jsonName() {
    return "id";
  }

}

class Version extends Value<int> {
  @override
  int absentValue() {
    return 0;
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    if (json.containsKey(jsonName())) {
      var jsonValue = json[jsonName()];
      if (jsonValue is int)   {
        value = jsonValue;
      } 
    }
  }

  @override
  String label() {
    return "Version";
  }

  @override
  String jsonName() {
    return "_version";
  }

  int increment() {
    return value += 1;
  }
  
}

mixin Mutation<T extends Aggregate> {
  mutate(T aggregate);
}

abstract class Aggregate {

  void mutate(Mutation mut);

}

class AggregateEvent {
  int version = 0;
} 


