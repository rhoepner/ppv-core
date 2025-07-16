import 'package:partner/partner.dart';
import 'package:partner/src/addresse.dart';
import 'package:partner/src/geschlecht.dart';
import 'package:partner/src/unit_of_work.dart';
import 'package:test/test.dart';

void main() {
  group('Mutate a Partner', () {

    test('Constructor', () {
      var jut = Adresse();
      expect(jut.plz, '');
      expect(jut.ort, '');
      expect(jut.strasse, '');
    });

    test('Change State', () {
      var uow = UnitOfWork();
      var partner = Partner();
      partner.mutate(uow, PartnerState(
        vorname: "Reinhard",
        nachname: "Höpner",
        geschlecht: Geschlecht.maennlich
      ));
      partner.mutate(uow, AdresseState(
        AdressArt.meldeadresse,
        plz: '50679',
        ort: 'Köln',
        strasse: 'Thusneldastraße 2'
      ));

      assert(uow.isDirty(), isTrue);
      expect(uow.sources.length, 2);
    });


  });

}
