#!/usr/bin/dart
import 'package:simple_cas/base.dart';
import 'package:simple_cas/dependency.dart';


void main() {
  const x = ScalarSymbol('x');
  const y = ScalarSymbol('y');
  const z = ScalarSymbol('z');
  const three = Int(3);


  var manager = DependencyManager();
  var success = manager.tryDefine(x, y + z);
  manager.onChange(x).listen(print, onDone: () => print('stream closed'));
  print(success);
  print(manager.getDefinition(x));
  manager
    ..clean(x)
    ..tryDefine(y, two)
    ..clean(x)
    ..tryDefine(y, three)
    ..clean(x)
    ..tryDefine(z, two)
    ..clean(x)
    ..tryDefine(y, null)
    ..clean(x);

  var s2 = manager.tryDefine(y, x + two);
  print('s2 = $s2');
  manager
    ..clean(x)
    ..tryDefine(x, null)
    ..cleanAll();
}
