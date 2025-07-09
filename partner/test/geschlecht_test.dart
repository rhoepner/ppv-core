import 'package:partner/src/geschlecht.dart';
import 'package:test/test.dart';

void main() {
  group('Geschlecht.fromString', () {

    test('Happy Case', () {
      expect(Geschlecht.fromString("maennlich"), Geschlecht.maennlich);
      expect(Geschlecht.fromString("weiblich"), Geschlecht.weiblich);
      expect(Geschlecht.fromString("divers"), Geschlecht.divers);
    });


    test('Unbekannt', () {
      expect(Geschlecht.fromString(null), Geschlecht.unbekannt);
      expect(Geschlecht.fromString("foo"), Geschlecht.unbekannt);
    });    

    test('Display', () {
      expect(Geschlecht.unbekannt.display, "unbekannt");
      expect(Geschlecht.maennlich.display, "männlich");
    });     

  });

  group('Geschlecht.fromMap', () {
    test('Happy Case', () {
      expect(Geschlecht.fromJson({'geschlecht': 'weiblich'}), Geschlecht.weiblich);
      expect(Geschlecht.fromJson({'geschlecht': 'maennlich'}), Geschlecht.maennlich);
      expect(Geschlecht.fromJson({'geschlecht': 'divers'}), Geschlecht.divers);      
    });

    test('Missing', () {
      expect(Geschlecht.fromJson({}), Geschlecht.unbekannt);
      expect(Geschlecht.fromJson({'tag': 'Montag'}), Geschlecht.unbekannt);
      expect(Geschlecht.fromJson({'geschlecht': 'foo'}), Geschlecht.unbekannt);      
    });    

    test('Bad value', () {
      expect(Geschlecht.fromJson({'geschlecht': 'foo'}), Geschlecht.unbekannt);      
      expect(Geschlecht.fromJson({'geschlecht': true}), Geschlecht.unbekannt);      
      expect(Geschlecht.fromJson({'geschlecht': 127}), Geschlecht.unbekannt);      
    });    

  }); 

}