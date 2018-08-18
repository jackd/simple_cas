part of 'graph.dart';

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
