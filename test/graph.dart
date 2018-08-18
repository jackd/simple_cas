#!/usr/bin/dart
import 'package:simple_cas/graph.dart';
import 'package:test/test.dart';

Iterable<V> Function(V) mapToFunc<V>(Map<V, Iterable<V>> map) =>
    (V v) => map[v] ?? const [];

void main() {
  group('search', () {
    final childrenMap = <int, List<int>>{
      0: [1, 2],
      1: [2],
      2: [],
      3: []
    };
    var children = mapToFunc(childrenMap);

    test('dfs', () {
      expect(dfs<int>([0], children).toList(), equals([0, 2, 1]));
      expect(dfs<int>([1], children).toList(), equals([1, 2]));
      expect(dfs<int>([2], children).toList(), equals([2]));
      expect(dfs<int>([3], children).toList(), equals([3]));
    });

    test('bfs', () {
      expect(bfs<int>([0], children).toList(), equals([0, 1, 2]));
      expect(bfs<int>([1], children).toList(), equals([1, 2]));
      expect(bfs<int>([2], children).toList(), equals([2]));
      expect(bfs<int>([3], children).toList(), equals([3]));
    });
  });

  group('connected', () {
    final childrenMap = <int, List<int>>{
      0: [1, 2],
      1: [2],
      2: [0],
      3: [3, 4],
    };
    var children = mapToFunc(childrenMap);

    test('stronglyConnectedComponents', () {
      expect(stronglyConnectedComponents(
        [0, 1, 2, 3], children).map((i) => i.toList()).toList(), equals([
          [2, 1, 0],
          [4],
          [3],
        ]));
    });
  });
}
