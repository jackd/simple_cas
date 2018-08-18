part of 'graph.dart';

abstract class DirectedGraph<V> {
  factory DirectedGraph() = DirectedGraphBase<V>;
  factory DirectedGraph.acyclic() = DirectedAcyclicGraph<V>;

  bool addEdge(V start, V end);
  bool addEdges(V start, Iterable<V> ends);

  bool removeEdge(V start, V end);
  bool removeEdges(V start, Iterable<V> ends);

  Iterable<V> children(V node);
}

class DirectedGraphBase<V> implements DirectedGraph<V> {
  final Map<V, Set<V>> _forward;

  DirectedGraphBase._create(this._forward);
  factory DirectedGraphBase() => DirectedGraphBase<V>._create(<V, Set<V>>{});

  bool addEdge(V start, V end) {
    _forward.putIfAbsent(start, () => Set<V>()).add(end);
    return true;
  }

  bool addEdges(V start, Iterable<V> ends) {
    _forward.putIfAbsent(start, () => Set<V>()).addAll(ends);
    return true;
  }

  bool removeEdge(V start, V end) {
    if (_forward.containsKey(start)) {
      var s = _forward[start];
      if (s.contains(end)) {
        _forward[start].remove(end);
        return true;
      }
    }
    return false;
  }

  bool removeEdges(V start, Iterable<V> ends) {
    if (_forward.containsKey(start)) {
      var s = _forward[start];
      if (s.containsAll(ends)) {
        s.removeAll(ends);
        return true;
      }
    }
    return false;
  }

  Iterable<V> children(V node) =>
      _forward.containsKey(node) ? _forward[node] : const [];
}


class DirectedAcyclicGraph<V> extends DirectedGraphBase<V> {
  Iterable<V> children(V node) =>
      _forward.containsKey(node) ? _forward[node] : const [];

  DirectedAcyclicGraph._create(Map<V, Set<V>> forward)
      : super._create(forward);

  factory DirectedAcyclicGraph() =>
      DirectedAcyclicGraph._create(<V, Set<V>>{});

  bool canAddEdge(V start, V end) => !dfs([end], children).contains(start);

  bool addEdge(V start, V end) {
    if (canAddEdge(start, end)) {
      return super.addEdge(start, end);
    } else {
      return false;
    }
  }

  bool addEdges(V start, Iterable<V> ends) {
    var added = <V>[];
    for (var end in ends) {
      if (!addEdge(start, end)) {
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


class DelegatingDirectedGraph<V> implements DirectedGraph<V>{
  final DirectedGraph<V> _base;
  DelegatingDirectedGraph(DirectedGraph<V> base): _base = base;

  @override
  bool addEdge(V start, V end) => _base.addEdge(start, end);

  @override
  bool addEdges(V start, Iterable<V> ends) => _base.addEdges(start, ends);

  @override
  Iterable<V> children(V node) => _base.children(node);

  @override
  bool removeEdge(V start, V end) => _base.removeEdge(start, end);

  @override
  bool removeEdges(V start, Iterable<V> ends) => _base.removeEdges(start, ends);
}


class ReversibleDirectedGraph<V> extends DelegatingDirectedGraph<V> {
  ReversibleDirectedGraph(): super(DirectedGraph<V>());
  ReversibleDirectedGraph.acyclic(): super(DirectedGraph<V>.acyclic());


  final  _reversed = DirectedGraph<V>();
  Iterable<V> reversedChildren(V node) => _reversed.children(node);

  @override
  bool addEdge(V start, V end) {
    var s = super.addEdge(start, end);
    if (s) {
      _reversed.addEdge(end, start);
    }
    return s;
  }

  @override
  bool addEdges(V start, Iterable<V> ends) {
    var s = super.addEdges(start, ends);
    if (s) {
      ends.forEach((end) => _reversed.addEdge(end, start));
    }
    return s;
  }

  @override
  bool removeEdge(V start, V end) {
    var s = super.removeEdge(start, end);
    if (s) {
      _reversed.removeEdge(end, start);
    }
    return s;
  }

  bool removeEdges(V start, Iterable<V> ends) {
    var s = super.removeEdges(start, ends);
    if (s) {
      ends.forEach((end) => _reversed.removeEdge(end, start));
    }
    return s;
  }
}
