#!/usr/bin/dart
import 'package:test/test.dart';
import 'package:simple_cas/parser.dart';
import 'package:simple_cas/base.dart';
import 'package:built_collection/built_collection.dart';

void main() {
  const x = ScalarSymbol('x');
  const y = ScalarSymbol('y');
  const f = ScalarSymbol('f');
  var fx = ScalarFunctionCall(f, BuiltList([x]));

  group('parser', () {
    var parser = SimpleCasParser();
    dynamic parse(String s) => parser.parse(s).value;

    test('Integers', () {
      expect(parse('1'), equals(one));
      expect(parse('-2'), equals(Int(-2)));
      expect(parse('123'), equals(Int(123)));
    });

    test('Float', () {
      expect(parse('1.0'), equals(one));
      expect(parse('-1.30'), equals(Float(-1.3)));
      expect(parse('1.5e-2'), equals(Float(1.5e-2)));
      expect(parse('-1.5e2'), equals(Float(-1.5e2)));
      expect(parse('-1.5e+2'), equals(Float(-1.5e+2)));
    });

    test('scalar symbols', () {
      expect(parse('x'), equals(x));
      expect(parse('y'), equals(y));
    });

    test('bracketed symbols', () {
      expect(parse('(x)'), equals(x));
      expect(parse('(2)'), equals(two));
    });

    test('unary negative', () {
      expect(parse('-x'), equals(-x));
      expect(parse('-(2)'), equals(-two));
    });

    test('sum', () {
      expect(parse('x + y'), equals(sum([x, y])));
      expect(parse('x + 2'), equals(sum([x, two])));
      expect(parse('x + 2'), equals(sum([x, two])));
      expect(parse('x + y + 2'), equals(sum([x, y, two])));
      expect(parse('x + y - 2'), equals(sum([x, y, -two])));
    });

    test('product', () {
      expect(parse('x*y'), equals(product([x, y])));
      expect(parse('x*y*2'), equals(product([x, y, two])));
      expect(parse('x*y/2'), equals(product([x, y]) / two));
      expect(parse('x*y/2*3'), equals(product([x, y]) / two * Int(3)));
    });

    test('power', () {
      expect(parse('x^2'), equals(x.pow(two)));
      expect(parse('x^-1'), equals(x.pow(negativeOne)));
    });

    test('functionCall', () {
      expect(parse('f(x, y)'),
          equals(ScalarFunctionCall(f, BuiltList([x, y]))));
      expect(
          parse('f(2*x, -y)'),
          equals(
              ScalarFunctionCall(f, BuiltList([two * x, -y]))));
    });

    test('compound expressions', () {
      expect(parse('2*x + y'), equals(two*x + y));
      expect(parse('2*(x + y)'), equals(two * (x + y)));
      expect(parse('2 + x*y'), equals(two + x * y));
      expect(parse('2 / y + x'), equals(two / y + x));
      expect(parse('f(x)*y + 2'), equals(fx*y + two));
      expect(parse('2^x*y'), equals(two.pow(x)*y));
      expect(parse('-2^x'), equals(-two.pow(x)));
      expect(parse('y+2^x'), equals(y+two.pow(x)));
      expect(parse('y-2^x'), equals(y-two.pow(x)));
    });
  });
}
