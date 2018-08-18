library simple_cas.dependency;

import 'dart:async';
import 'package:simple_cas/base.dart';
import 'package:simple_cas/graph.dart';

class DependencyManager {
  final _graph = SymmetricDirectedAcyclicGraph<ScalarSymbol>();
  final _dirty = Set<ScalarSymbol>();
  final _controllers = Map<ScalarSymbol, StreamController<Scalar>>();
  final _values = Map<ScalarSymbol, Scalar>();
  Stream<Scalar> getStream(Scalar s) => _controllers[s]?.stream;

  bool isDirty(Scalar s) => _dirty.contains(s);

  bool tryAssign(ScalarSymbol key, Scalar value) {
    var children = value.subExpressions().where((c) => c is ScalarSymbol);
    var success = _graph.tryAddEdges(key, children);
    if (success) {
      var oldVal = _values[key];
      if (oldVal != value) {
        _values[key] = value;
        _dirty.addAll(dfs([key], _graph.reverseChildren));
      }
    }
    return success;
  }
}
