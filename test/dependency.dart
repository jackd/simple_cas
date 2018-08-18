#!/usr/bin/dart
import 'package:test/test.dart';
import 'package:simple_cas/base.dart';
import 'package:simple_cas/dependency.dart';



void main() {
  const x = ScalarSymbol('x');
  const y = ScalarSymbol('y');
  const z = ScalarSymbol('z');
  const three = Int(3);

  group('dependencyManager', () {
    test('basic usage', () {
      var manager = DependencyManager();
      expect(manager.tryDefine(x, y + z), isTrue);
      expect(manager.getDefinition(x), equals(y + z));
      expect(manager.tryDefine(y, x+z), isFalse);
      expect(manager.tryDefine(y, two), isTrue);
      expect(manager.getValue(x), equals(two + z));
      expect(manager.tryDefine(y, three), isTrue);
      expect(manager.getValue(x), equals(three + z));
      expect(manager.tryDefine(z, two), isTrue);
      expect(manager.getValue(z), equals(two));
      expect(manager.getValue(x), equals(Int(5)));
    });
  });
}
