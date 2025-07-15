import 'package:partner/partner.dart';
import 'package:partner/src/geschlecht.dart';
import 'package:partner/src/unit_of_work.dart';
import 'package:test/test.dart';

void main() {
  group('Mutate a Partner', () {
    final partner = Partner();

    setUp(() {
      // Additional setup goes here.
    });

    test('Constructor', () {
      expect(partner.vorname, "");
      expect(partner.nachname, "");
      expect(partner.geschlecht, Geschlecht.unbekannt);
    });

    test('Change State', () {
      var uow = UnitOfWork();
      partner.mutate(uow, PartnerState(
        vorname: "Reinhard",
        nachname: "Höpner",
        geschlecht: Geschlecht.maennlich
      ));
      expect(partner.vorname, "Reinhard");
      expect(partner.nachname, "Höpner");
      expect(partner.geschlecht, Geschlecht.maennlich);
      assert(uow.isDirty(), isTrue);
      expect(uow.sources.length, 1);
    });

    test('Change State Twice', () {
      var uow = UnitOfWork();
      partner.mutate(uow, PartnerState(
        vorname: "Reinhard",
        nachname: "Höpner",
        geschlecht: Geschlecht.maennlich
      ));

      partner.mutate(uow, PartnerState(
        vorname: "Reinhard",
        nachname: "Rößler",
        geschlecht: Geschlecht.maennlich
      ));
      expect(partner.nachname, "Rößler");
      expect(partner.geschlecht, Geschlecht.maennlich);
      assert(uow.isDirty(), isTrue);
      expect(uow.sources.length, 2);
    });  

    test('No Change State', () {
      var uow = UnitOfWork();

      partner.mutate(uow, PartnerState(
        vorname: "Reinhard",
        nachname: "Höpner",
        geschlecht: Geschlecht.maennlich
      ));

      partner.mutate(uow, PartnerState(
        vorname: "Reinhard",
      ));

      expect(partner.vorname, "Reinhard");
      assert(uow.isDirty(), isTrue);
      expect(uow.sources.length, 1);
      expect(uow.sources[0]["_source"], "partner.state");
    });        

  });

  // group("Json encoding",() {
  //   var partner = Partner();
  //   partner.vorname.value = "Reinhard"; 
  //   partner.nachname.value = "Rößler";
  //   var json = partner.toJson();  
  //   test("Json encoding", () {
  //     expect(json["vorname"], "Reinhard");
  //     expect(json["nachname"], "Rößler");
  //   });

  //   test("Json decoding", () {
  //     var json = '''
  //     {
  //       "vorname": "Reinhard",
  //       "nachname": "Rößler"
  //     }
  //     ''';
  //     var decoded = Partner.fromJson(jsonDecode(json));
  //     expect(decoded.vorname.value, "Reinhard");
  //     expect(decoded.nachname.value, "Rößler");
  //   });

  // });

  // group("Partner State",() {
  //   var state = PartnerMut(
  //     vorname: 'Reinhard',
  //     nachname: 'Höpner',
  //     geschlecht: Geschlecht.maennlich
  //   );

  //   test("Json encoding", () {
  //     expect(state.geschlecht, allOf([
  //       isNotNull
  //     ]));
  //   });

  //   test("Json decoding", () {
  //     var json = '''
  //     {
  //       "vorname": "Reinhard",
  //       "nachname": "Rößler"
  //     }
  //     ''';
  //     var decoded = Partner.fromJson(jsonDecode(json));
  //     expect(decoded.vorname.value, "Reinhard");
  //     expect(decoded.nachname.value, "Rößler");
  //   });

  // });  
}
