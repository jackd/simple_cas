#!/usr/bin/dart
import 'package:simple_cas/base.dart';
import 'package:simple_cas/parser.dart';
import 'package:test/test.dart';

void main() {
  const x = ScalarSymbol('x');
  const y = ScalarSymbol('y');

  group('parser', () {
    // test('ints', () {
    //   expect(stringToScalar('2'), equals(two));
    //   expect(stringToScalar('-1'), equals(negativeOne));
    //   expect(stringToScalar('-2'), equals(Int(-2)));
    // });
    //
    // test('floats', () {
    //   expect(stringToScalar('2.3'), equals(Float(2.3)));
    //   expect(stringToScalar('-2.3'), equals(Float(-2.3)));
    //   expect(stringToScalar('2.3e-5'), equals(Float(2.3e-5)));
    // });
    //
    // test('symbols', () {
    //   expect(stringToScalar('x'), equals(x));
    //   expect(stringToScalar('y'), equals(y));
    //   expect(stringToScalar('y'), equals(y));
    // });

    test('sum', () {
      expect(stringToScalar('2 + 3'), equals(two + Int(3)));
      expect(stringToScalar('x + y'), equals(x + y));
      expect(stringToScalar('x + 2'), equals(x + two));
    });
  });

  // group('sums', () {
  //
  // });
}
