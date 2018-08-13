#!/usr/bin/dart
import 'package:simple_cas/petit_parser.dart';
// import 'package:petitparser/petitparser.dart';

void main() {
  // var grammar = SimpleCasGrammar();
  // print(grammar.parse('2'));
  // print(grammar.parse('2.3'));
  // print(grammar.parse('-2'));
  // print(grammar.parse('-2.4'));
  // print(grammar.parse('-2.4e3'));

  // print(grammar.parse('x'));
  // print(grammar.parse('x + 2'));
  // print(grammar.parse('x * 2'));
  // print(grammar.parse('x * 2 + y'));
  // print(grammar.parse('x * (2 + y)'));
  // print(grammar.parse('x + z * y'));
  // var result = grammar.parse('x + z * y');
  // print(result.value[0]);
  //
  var parser = SimpleCasParser();
  var out = parser.parse('        x         + z*y');
  print(out.value.left.toString().length);
}
