part of 'graph.dart';

/// Finds the strongly connected components of a directed graph using Tarjan's
/// algorithm.
///
/// The result will be a valid reverse topological order ordering of the
/// strongly connected components. Components further from a root will appear in
/// the result before the components which they are children of.
///
/// Nodes within a strongly connected component have no ordering guarantees,
/// except that if the first value in [nodes] is a valid root, and is contained
/// in a cycle, it will be the last element of that cycle.
///
/// [V] is the type of values in the graph nodes and must be a type suitable
/// for using as a Map or Set key. [children] should return the next reachable
/// nodes.
///
/// [nodes] must contain at least a root of every tree in the graph if there are
/// disjoint subgraphs but it may contain all nodes in the graph if the roots
/// are not known.
///
/// Original version from [here](https://github.com/dart-lang/graphs)
Iterable<List<V>> stronglyConnectedComponents<V> (
    Iterable<V> nodes, Iterable<V> Function(V) children) sync* {
  final lowLinks = <V, int>{};
  final indexes = <V, int>{};
  final onStack = Set<V>();

  var index = 0;
  var lastVisited = Queue<V>();

  List<V> finalConnect(V node) {
    V next;
    var result = <V>[];
    do {
      next = lastVisited.removeLast();
      onStack.remove(next);
      result.add(next);
    } while (next != node);
    return result;
  }

  Iterable<List<V>> strongConnect(V node) sync* {
    indexes[node] = index;
    lowLinks[node] = index;
    index++;
    lastVisited.addLast(node);
    onStack.add(node);
    for (final V next in children(node) ?? const []) {
      if (!indexes.containsKey(next)) {
        yield* strongConnect(next);
        lowLinks[node] = min(lowLinks[node], lowLinks[next]);
      } else if (onStack.contains(next)) {
        lowLinks[node] = min(lowLinks[node], indexes[next]);
      }
    }
    if (lowLinks[node] == indexes[node]) {
      yield finalConnect(node);
    }
  }

  for (final node in nodes) {
    if (!indexes.containsKey(node)) {
      yield* strongConnect(node);
    }
  }
}
