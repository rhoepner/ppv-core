import 'package:partner/partner.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final vorname = Vorname();

    setUp(() {
      // Additional setup goes here.
    });

    test('Constructed', () {
      expect(vorname.label(), "Vorname");
      expect(vorname.isAbsent(), true);
    });


    test('Setter', () {
      vorname.value = "Reinhard";
      expect(vorname.value, "Reinhard");
      expect(vorname.isAbsent(), false);
    });

    test('Partner', () {
      var partner = Partner();
      expect(partner.vorname.isAbsent(), true);
      partner.vorname.value = "Reinhard";
      expect(partner.vorname.isAbsent(), false);
    });

  });
}
