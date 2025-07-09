
import 'package:partner/src/aggregate.dart';
import 'package:partner/src/geschlecht.dart';
import 'package:partner/src/value.dart';

class Partner implements Aggregate {
  String __vorname = '';
  String __nachname = '';
  Geschlecht __geschlecht = Geschlecht.unbekannt;

  Partner();

  String get vorname => __vorname;

  String get nachname => __nachname;

  Geschlecht get geschlecht => __geschlecht;

  set _vorname(value) {
    __vorname = value;
  }

  set _nachname(value) {
    __nachname = value;
  }

  set _geschlecht(value) {
    __geschlecht = value;
  }

  // factory Partner.fromJson(Map<String, dynamic> data) {
  //   var result = Partner()
  //     ..vorname.fromJson(data)
  //     ..nachname.fromJson(data);
  //   return result;
  // }  
  
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> json = {};
  //   nachname.toJson(json);
  //   vorname.toJson(json);
  //   return json;
  // }
  
  @override
  void mutate(Mutation<Aggregate> mut) {
      mut.mutate(this);
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

/// Mutation für die Basis-Daten eines Partners
class PartnerMut with Mutation<Partner> {
  final String? vorname;
  final String? nachname;
  final Geschlecht? geschlecht;

  PartnerMut({
    this.nachname, 
    this.vorname, 
    this.geschlecht
  });
  
  @override
  mutate(Partner aggregate) {
    if (vorname is String) {
      aggregate._vorname = vorname;
    }
    if (nachname is String) {
      aggregate._nachname = nachname;
    }
    if (geschlecht is Geschlecht) {
      aggregate._geschlecht = geschlecht;
    }
  }

  

  // factory PartnerState.fromJson(Map<String, dynamic> data) {
  //   var result = PartnerState()
  //     ..vorname.fromJson(data)
  //     ..nachname.fromJson(data);
  //   return result;
  // }  
  
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> json = {};
  //   nachname.toJson(json);
  //   vorname.toJson(json);
  //   return json;
  // }  
}

abstract class PartnerEvent {
  int version = 0;

  replay(Partner partner);
}
