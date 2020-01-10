import 'dart:math';

void main() {
  // 构造函数
  // Map()
  var map = Map<String, int>();
  map["A"] = 1;
  map["B"] = 2;
  map[null] = 3; // map: {A: 1, B: 2, null: 4}
  print("map: $map"); // map: {A: 1, B: 2, null: 4}

  // Map.from
  Map mapOther = Map<String, int>()
    ..["A"] = 1
    ..["B"] = 2
    ..["C"] = 3;
  var mapFrom = Map<String, num>.from(mapOther); // mapFrom: {A: 1, B: 2, C: 3}

  print("mapFrom: $mapFrom");

  // Map.fromEntries
  var mapFromEntries = Map<String, double>.fromEntries([
    MapEntry("A", 1),
    MapEntry("B", 2),
    MapEntry("A", 2)
  ]); // {A: 2.0, B: 2.0}

  print("mapFromEntries: $mapFromEntries"); // map: {A: 1, B: 2, null: 4}

  // Map.fromIterable
  var map1 = Map<String, String>.fromIterable(["A1", "B1", "A2"]); // {A1: A1, B1: B1, A2: A2}
  var map2 = Map<String, String>.fromIterable(["A1", "B1", "A2"], key: (ele) => ele[0]); // {A: A2, B: B1}
  var map3 = Map<String, int>.fromIterable(
    ["A1", "B1", "A2"],
    key: (ele) => ele[0],
    value: (ele) => int.tryParse(ele[1]) ?? -1,
  ); // {A: 2, B: 1}
  print("map1: $map1"); // map: {A: 1, B: 2, null: 4}
  print("map2: $map2"); // map: {A: 1, B: 2, null: 4}
  print("map3: $map3"); // map: {A: 1, B: 2, null: 4}
}
