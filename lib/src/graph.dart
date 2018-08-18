library simple_cas.graph;

import 'dart:collection';

Iterable<V> dfs<V>(
    Iterable<V> startNodes, Iterable<V> children(V child)) sync* {
  final visited = Set<V>();
  var stack = Queue<V>.from(startNodes);
  while (!stack.isEmpty) {
    var current = stack.removeLast();
    if (!visited.contains(current)) {
      yield current;
      visited.add(current);
      stack.addAll(children(current));
    }
  }
}

Iterable<V> bfs<V>(
    Iterable<V> startNodes, Iterable<V> children(V child)) sync* {
  final visited = Set<V>();
  var queue = Queue<V>.from(startNodes);
  while (!queue.isEmpty) {
    var current = queue.removeFirst();
    if (!visited.contains(current)) {
      yield current;
      visited.add(current);
      queue.addAll(children(current));
    }
  }
}

abstract class DirectedGraph<V> {
  factory DirectedGraph() = DirectedGraphBase<V>;
  factory DirectedGraph.acyclic() = DirectedAcyclicGraphBase<V>;

  void addEdge(V start, V end);
  void addEdges(V start, Iterable<V> ends);

  void removeEdge(V start, V end);
  void removeEdges(V start, Iterable<V> ends);

  Iterable<V> children(V node);
}

class DirectedGraphBase<V> implements DirectedGraph<V> {
  final Map<V, Set<V>> _forward;

  DirectedGraphBase._create(this._forward);
  factory DirectedGraphBase() => DirectedGraphBase<V>._create(<V, Set<V>>{});

  void addEdge(V start, V end) {
    _forward.update(start, (s) {
      s.add(end);
    }, ifAbsent: () => Set<V>());
  }

  void addEdges(V start, Iterable<V> ends) {
    _forward.update(start, (s) {
      s.addAll(ends);
    }, ifAbsent: () => Set<V>());
  }

  void removeEdge(V start, V end) {
    if (_forward.containsKey(start)) {
      var s = _forward[start];
      if (s.contains(end)) {
        _forward[start].remove(end);
        return;
      }
    }
    throw NoEdgeError<V>(start, end);
  }

  void removeEdges(V start, Iterable<V> ends) {
    if (_forward.containsKey(start)) {
      var s = _forward[start];
      if (s.containsAll(ends)) {
        s.removeAll(ends);
        return;
      }
    }
    throw NoEdgeError<V>(start, ends);
  }

  Iterable<V> children(V node) =>
      _forward.containsKey(node) ? _forward[node] : const [];

  // bool tryAddEdge(V start, V end) {
  //   addEdge(start, end);
  //   return true;
  // }
  // bool tryAddEdges(V start, Iterable<V> ends) {
  //   addEdges(start, ends);
  //   return true;
  // }
}

class CycleInducingError<V> extends ArgumentError {
  final V start;
  final Object end;
  CycleInducingError(this.start, this.end)
      : super('Adding edge $start -> $end would induce a cycle');
}

class NoEdgeError<V> extends ArgumentError {
  final V start;
  final Object end;
  NoEdgeError(this.start, this.end)
      : super(end == null
            ? 'No edges for $start'
            : 'No edge between $start and $end');
}

abstract class DirectedAcyclicGraph<V> implements DirectedGraph<V> {
  bool tryAddEdge(V start, V end);
  bool tryAddEdges(V start, Iterable<V> ends);

  factory DirectedAcyclicGraph() = DirectedAcyclicGraphBase<V>;
}

class DirectedAcyclicGraphBase<V> extends DirectedGraphBase<V>
    implements DirectedAcyclicGraph<V> {
  Iterable<V> children(V node) =>
      _forward.containsKey(node) ? _forward[node] : const [];

  DirectedAcyclicGraphBase._create(Map<V, Set<V>> forward)
      : super._create(forward);

  factory DirectedAcyclicGraphBase() =>
      DirectedAcyclicGraphBase._create(<V, Set<V>>{});

  bool canAddEdge(V start, V end) => !dfs([end], children).contains(start);

  void addEdge(V start, V end) {
    if (!tryAddEdge(start, end)) {
      throw CycleInducingError<V>(start, end);
    }
  }

  void addEdges(V start, Iterable<V> ends) {
    if (!tryAddEdges(start, ends)) {
      throw CycleInducingError<V>(start, ends);
    }
  }

  bool tryAddEdge(V start, V end) {
    if (canAddEdge(start, end)) {
      super.addEdge(start, end);
      return true;
    } else {
      return false;
    }
  }

  bool tryAddEdges(V start, Iterable<V> ends) {
    var added = <V>[];
    for (var end in ends) {
      if (!tryAddEdge(start, end)) {
        for (var a in added) {
          removeEdge(start, a);
        }
        return false;
      }
      added.add(end);
    }
    return true;
  }
}

abstract class SymmetricDirectedGraph<V> implements DirectedGraph<V> {
  SymmetricDirectedGraph<V> reverse();
  Iterable<V> reverseChildren(V node);
}

abstract class SymmetricDirectedGraphMixin<V>
    implements SymmetricDirectedGraph<V> {
  DirectedGraph<V> get _forwardGraph;
  DirectedGraph<V> get _backwardGraph;

  // SymmetricDirectedGraph._create(this._forwardGraph, this._backwardGraph);
  // factory SymmetricDirectedGraph() =>
  //     SymmetricDirectedGraph._create(DirectedGraph(), DirectedGraph());
  // factory SymmetricDirectedGraph.acyclic() => SymmetricDirectedGraph._create(
  //     DirectedGraph<V>.acyclic(), DirectedGraph<V>());

  @override
  void addEdge(V start, V end) {
    _forwardGraph.addEdge(start, end);
    _backwardGraph.addEdge(end, start);
  }

  @override
  void addEdges(V start, Iterable<V> ends) {
    _forwardGraph.addEdges(start, ends);
    for (var end in ends) {
      _backwardGraph.addEdge(end, start);
    }
  }

  @override
  Iterable<V> children(V node) => _forwardGraph.children(node);

  @override
  void removeEdge(V start, V end) {
    _forwardGraph.removeEdge(start, end);
    _backwardGraph.removeEdge(end, start);
  }

  @override
  void removeEdges(V start, Iterable<V> ends) {
    _forwardGraph.removeEdges(start, ends);
    ends.forEach((end) => _backwardGraph.removeEdge(end, start));
  }

  Iterable<V> reverseChildren(V node) => _backwardGraph.children(node);
}

class SymmetricDirectedGraphBase<V> extends Object
    with SymmetricDirectedGraphMixin<V> {
  final DirectedGraph<V> _forwardGraph;
  final DirectedGraph<V> _backwardGraph;
  SymmetricDirectedGraphBase._create(this._forwardGraph, this._backwardGraph);
  factory SymmetricDirectedGraphBase() => SymmetricDirectedGraphBase._create(
      DirectedGraph<V>(), DirectedGraph<V>());

  @override
  SymmetricDirectedGraph<V> reverse() =>
      SymmetricDirectedGraphBase._create(_backwardGraph, _forwardGraph);
}

class SymmetricDirectedAcyclicGraph<V> extends Object
    with SymmetricDirectedGraphMixin<V>
    implements DirectedAcyclicGraph<V> {
  final DirectedAcyclicGraph<V> _forwardGraph;
  final DirectedAcyclicGraph<V> _backwardGraph;
  SymmetricDirectedAcyclicGraph._create(
      this._forwardGraph, this._backwardGraph);
  factory SymmetricDirectedAcyclicGraph() =>
      SymmetricDirectedAcyclicGraph<V>._create(
          DirectedAcyclicGraph<V>(), DirectedAcyclicGraph<V>());

  bool tryAddEdge(V start, V end) {
    if (_forwardGraph.tryAddEdge(start, end)) {
      if (_backwardGraph.tryAddEdge(end, start)) {
        return true;
      } else {
        throw StateError('Inconsistent forward/backward graphs...');
      }
    } else {
      return false;
    }
  }

  @override
  bool tryAddEdges(V start, Iterable<V> ends) {
    if (_forwardGraph.tryAddEdges(start, ends)) {
      if (ends.every((end) => _backwardGraph.tryAddEdge(end, start))) {
        return true;
      } else {
        throw StateError('Inconsistent forward/backward graphs...');
      }
    } else {
      return false;
    }
  }

  @override
  SymmetricDirectedAcyclicGraph<V> reverse() =>
      SymmetricDirectedAcyclicGraph._create(_backwardGraph, _forwardGraph);
}
