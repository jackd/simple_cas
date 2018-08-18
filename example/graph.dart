#!/usr/bin/dart
import 'package:simple_cas/graph.dart';

Iterable<V> Function(V) mapToFunc<V>(Map<V, Iterable<V>> map) =>
    (V v) => map[v] ?? const [];

void main() {
  final childrenMap = <int, List<int>>{
    0: [1, 2],
    1: [2],
    2: [0],
    3: [3],
  };
  var children = mapToFunc(childrenMap);
  var out = stronglyConnectedComponents(
      [0, 1, 2, 3], children).map((i) => i.toList()).toList();
  print(out);
}
