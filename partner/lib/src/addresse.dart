import 'package:partner/partner.dart';
import 'package:partner/src/spec.dart';
import 'package:partner/src/unit_of_work.dart';

enum AdressArt { meldeadresse, briefadresse, unbekannt }

class Adresse {
  static const StringValueSpec $plz = StringValueSpec("plz");
  static const StringValueSpec $ort = StringValueSpec("ort");
  static const StringValueSpec $strasse = StringValueSpec("strasse");
  static const EnumValueSpec<AdressArt> $geschlecht = EnumValueSpec(
    "geschlecht",
  );

  AdressArt _art = AdressArt.unbekannt;
  String _plz = '';
  String _ort = '';
  String _strasse = '';

  AdressArt get art => _art;

  String get plz => _plz;

  String get ort => _ort;

  String get strasse => _strasse;
}

class AdresseState extends PartnerSource {
  AdressArt art;
  final String? plz;
  final String? ort;
  final String? strasse;

  AdresseState(this.art, {this.plz, this.ort, this.strasse});

  @override
  mutate(UnitOfWork unitOfWork, Partner agg) {
    var adresse = agg.adressen[art];
    adresse ??= Adresse().._art = art;

    Map<String, dynamic> delta = {};

    adresse
      .._plz = Adresse.$plz.mut(adresse._plz, plz, delta)
      .._ort = Adresse.$ort.mut(adresse._ort, ort, delta)
      .._strasse = Adresse.$strasse.mut(adresse._strasse, strasse, delta);

    agg.adressen[art] = adresse;

    if (delta.isNotEmpty) {
      delta["_source"] = sourceId();
      unitOfWork.add(delta);
    }
  }

  @override
  String sourceId() {
    return 'partner.adresse.state';
  }

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
