
import 'package:partner/src/addresse.dart';
import 'package:partner/src/geschlecht.dart';
import 'package:partner/src/spec.dart';
import 'package:partner/src/unit_of_work.dart';

class Partner {

  static const StringValueSpec $vorname = StringValueSpec("vorname");
  static const StringValueSpec $nachname = StringValueSpec("nachname");
  static const EnumValueSpec<Geschlecht> $geschlecht = EnumValueSpec<Geschlecht>("geschlecht");

  String _vorname = '';
  String _nachname = '';
  Geschlecht _geschlecht = Geschlecht.unbekannt;
  final Map<AdressArt, Adresse> _adressen = {};

  Partner();

  String get vorname => _vorname;

  String get nachname => _nachname;

  Geschlecht get geschlecht => _geschlecht;

  Map<AdressArt, Adresse> get adressen => _adressen;

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
  void mutate(UnitOfWork unitOfWork, Partner agg);
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
  mutate(UnitOfWork unitOfWork, Partner agg) {
    Map<String, dynamic> delta = {};
    agg
      .._vorname = Partner.$vorname.mut(agg._vorname, vorname, delta)
      .._nachname = Partner.$nachname.mut(agg._nachname, nachname, delta)
      .._geschlecht = Partner.$geschlecht.mut(agg._geschlecht, geschlecht, delta);

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
