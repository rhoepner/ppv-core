import 'package:partner/partner.dart';
import 'package:partner/src/geschlecht.dart';
import 'package:test/test.dart';

void main() {
  group('Mutate a Partner', () {
    final partner = Partner();

    setUp(() {
      // Additional setup goes here.
    });

    test('Constructed', () {
      expect(partner.vorname, "");
      expect(partner.nachname, "");
      expect(partner.geschlecht, Geschlecht.unbekannt);
    });

    test('Mutate', () {
      var mut = PartnerMut(
        vorname: "Reinhard"
      );
      partner.mutate(mut);
      expect(partner.vorname, "Reinhard");
      expect(partner.nachname, "");
      expect(partner.geschlecht, Geschlecht.unbekannt);
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
