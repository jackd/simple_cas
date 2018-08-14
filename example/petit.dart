#!/usr/bin/dart
import 'package:simple_cas/parser.dart';
// import 'package:petitparser/petitparser.dart';

void main() {
  // var def = SimpleCasParserDefinition();
  // var parser = def.build(start: def.primary);
  // print(parser.parse('-2'));

  // var parser = SimpleCasGrammar();
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
  // var parser = SimpleCasParser();
  var def = SimpleCasParserDefinition();
  var parser = def.build(start: def.expression);
  print(parser.parse('x^2'));

  // var result = parser.parse('f(x, y)');
  // print(result);
  // var out = parser.parse('        x         + z*y');
  // print(out.value.left.toString().length);
  // var parser = (char('x') & char('x').star()).optional();
  // var out = parser.parse('');
  // print(out);
  // print(char('x').trim().flatten().parse('x    ').value.length);
}
