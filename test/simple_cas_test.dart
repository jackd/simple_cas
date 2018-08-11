import 'package:simple_cas/simple_cas.dart';
import 'package:test/test.dart';

void main() {
  group('Integers', () {
    test('integer values', () {
      expect(negativeOne.value, equals(-1));
      expect(zero.value, equals(0));
      expect(one.value, equals(1));
      expect(Int(5).value, equals(5));
      expect(Int(-4).value, equals(-4));
    });
    test('num values', () {
      expect(Num(3).value, equals(3));
      expect(Num(3.0).value, equals(3));
      expect(Num(-2).value, equals(-2));
      expect(Num(-2.3).value, equals(-2.3));
    });
    test('num equality', () {
      expect(Num(3), equals(Num(3)));
      expect(Num(3), equals(Num(3.0)));
      expect(Num(-3), equals(Num(-3)));
      expect(Num(-3), equals(Num(-3.0)));
    });
    test('basic arithmetic', () {
      expect((-Num(1)).simplify(), equals(Num(-1)));
      expect(Num(4).reciprocal().simplify(), equals(Num(1 / 4)));
      expect((-Num(5)).simplify(), equals(Num(-5)));
      expect((-Num(-5)).simplify(), equals(Num(5)));
      expect((Num(2) + Num(3)).simplify(), equals(Num(5)));
      expect((Num(5) - Num(3)).simplify(), equals(Num(2)));
      expect((Num(5) - Num(2.5)).simplify(), equals(Num(2.5)));
      expect(Num(3).pow(Num(3)).simplify(), equals(Num(27)));
      expect(Num(3).pow(Num(-3)).simplify(), equals(Num(1 / 27)));
    });

    test('symbol arithmetic', () {
      expect((Num(2) + Num(3) + ScalarSymbol('x')).simplify(),
          equals(Num(5) + ScalarSymbol('x')));
    });
  });
}
