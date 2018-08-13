#!/usr/bin/dart
import 'package:simple_cas/base.dart';
import 'package:test/test.dart';

void main() {
  const x = ScalarSymbol('x');
  const y = ScalarSymbol('y');

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
      expect((x*one).simplify(), equals(x));
      expect((x*(Int(3) - two)).simplify(), equals(x));
      expect((x + zero).simplify(), equals(x));
      expect((x + y + zero).simplify(), equals(x + y));
      expect((x + zero + y).simplify(), equals(x + y));
      expect((x * one * y).simplify(), equals(x * y));
      expect((x * one + y).simplify(), equals(x + y));
    });

    test('substitution', () {
      expect(x.substitute({x: two}), equals(two));
      expect(y.substitute({y: one}), equals(one));
      expect((two * x).substitute({x: Int(3)}).simplify(), equals(Int(6)));
      expect((x * y).substitute({x: Int(3)}), equals(Int(3) * y));
      expect((x * y).substitute({x: Int(3), y: Int(4)}).simplify(),
          equals(Int(12)));
    });

    test('toString', () {
      expect(Int(2).toString(), equals('2'));
      expect(Int(-4).toString(), equals('-4'));
      expect(Float(3.4).toString(), equals('3.4'));
      expect((Int(2) + x).toString(), equals('2 + x'));
      expect((Int(2) + Int(-3)).toString(), equals('2 - 3'));
      expect((Int(-2) + Int(3)).toString(), equals('-2 + 3'));
      expect((Int(2) + x + y).toString(), equals('2 + x + y'));
      expect((Int(2) * x + y).toString(), equals('2 * x + y'));
      expect((Int(2) * (x + y)).toString(), equals('2 * (x + y)'));
      expect((Int(2) * (-x)).toString(), equals('2 * (-x)'));
      expect(Int(3).pow(Int(4)).toString(), equals('3 ^ 4'));
      expect(Int(3).pow(Int(4) + x).toString(), equals('3 ^ (4 + x)'));
      expect(Int(3).pow(Int(4) * x).toString(), equals('3 ^ (4 * x)'));
      expect((one / x).toString(), equals('1 / x'));
      expect((two / x).toString(), equals('2 / x'));
      expect((one / (Int(2) + Int(3))).toString(), equals('1 / (2 + 3)'));
      expect((two / (Int(2) + Int(3))).toString(), equals('2 / (2 + 3)'));
    });
  });
}
