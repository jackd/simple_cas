library simple_cas.dependency;

import 'dart:async';
import 'package:simple_cas/base.dart';
import 'package:simple_cas/graph.dart';

class DependencyManager {
  final _graph = ReversibleDirectedGraph.acyclic<ScalarSymbol>();
  final _definitions = Map<ScalarSymbol, Scalar>();
  final _values = Map<ScalarSymbol, Scalar>();
  final _controllers = <ScalarSymbol, StreamController<Scalar>>{};
  final _dirty = Set<ScalarSymbol>();
  Stream<Scalar> onChange(Scalar s) => _controllers[s].stream;

  bool isDirty(Scalar s) => _dirty.contains(s);

  bool _remove(ScalarSymbol key) {
    if (_definitions.containsKey(key)) {
      _markDependentsDirty(key);
      _dirty.remove(key);
      _controllers.remove(key).close();
      var def = _definitions.remove(key);
      _values.remove(key);
      _graph.removeEdges(key, def.variables().toSet());
      return true;
    } else {
      return false;
    }
  }

  void _markDependentsDirty(ScalarSymbol key) {
    _dirty.addAll(
        dfs([key], _graph.reversedChildren).where(_definitions.containsKey));
  }

  bool tryDefine(ScalarSymbol key, Scalar definition) {
    if (definition == null) {
      return _remove(key);
    }
    var oldDef = _definitions.putIfAbsent(key, () => null);
    if (oldDef == definition) {
      return false;
    }
    _definitions[key] = definition;
    var newVars = definition.variables().toSet();
    var success = _graph.addEdges(key, newVars);
    if (success) {
      // remove edges not shared with newVars
      if (oldDef != null) {
        _graph.removeEdges(
            key, oldDef.variables().toSet().where((s) => !newVars.contains(s)));
      }
      _markDependentsDirty(key);
      _controllers[key] = StreamController<Scalar>();
    }
    return success;
  }

  void clean(ScalarSymbol key) {
    if (isDirty(key)) {
      var def = _definitions[key];
      def.variables().toSet().forEach(clean);
      var val = _values[key] = def.substitute(_values).simplify();
      _dirty.remove(key);
      _controllers[key].add(val);
    }
  }

  void cleanAll() {
    while (_dirty.isNotEmpty) {
      clean(_dirty.first);
    }
  }

  Scalar getDefinition(ScalarSymbol key) => _definitions[key];
  Scalar getValue(ScalarSymbol key) {
    clean(key);
    return _values[key];
  }
}
