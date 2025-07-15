
import 'package:partner/src/geschlecht.dart';
import 'package:partner/src/spec.dart';
import 'package:partner/src/unit_of_work.dart';

class Partner {

  static const StringValueSpec $vorname = StringValueSpec("vorname");
  static const StringValueSpec $nachname = StringValueSpec("nachname");

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
  
  void mutate(UnitOfWork unitOfWork, PartnerSource mutation) {
      mutation.mutate(unitOfWork, this);
  }
  
}

abstract class PartnerSource with Source {
  void mutate(UnitOfWork unitOfWork, Partner partner);
}

/// Mutation für die Basis-Daten eines Partners
class PartnerState extends PartnerSource {
  final String? vorname;
  final String? nachname;
  final Geschlecht? geschlecht;

  PartnerState({
    this.nachname, 
    this.vorname, 
    this.geschlecht
  });
  
  @override
  mutate(UnitOfWork unitOfWork, Partner aggregate) {
    Map<String, dynamic> delta = {};
    aggregate._vorname = Partner.$vorname.mut(aggregate.__vorname, vorname, delta);
    aggregate._nachname = Partner.$nachname.mut(aggregate.__nachname, nachname, delta);
    if (geschlecht is Geschlecht) {
      aggregate._geschlecht = geschlecht;
    }
    if (delta.isNotEmpty) {
      delta["_source"] = sourceId();
      unitOfWork.add(delta);
    }

  }
  
  @override
  String sourceId() {
    return "partner.state";
  }

  // factory PartnerState.fromJson(Map<String, dynamic> data) {
  //   var result = PartnerState()
  //     ..vorname.fromJson(data)
  //     ..nachname.fromJson(data);
  //   return result;
  // }  
  
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
    if (nachname != null) {
      map["nachname"] = nachname!;
    }
    if (vorname != null) {
      map["vorname"] = vorname!;
    }
    if (geschlecht != null) {
      map["geschlecht"] = geschlecht;
    }
    return map;
  }  
}

abstract class PartnerEvent {
  int version = 0;

  replay(Partner partner);
}
