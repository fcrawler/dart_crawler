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
  var map1 = Map<String, String>.fromIterable(
      ["A1", "B1", "A2"]); // {A1: A1, B1: B1, A2: A2}
  var map2 = Map<String, String>.fromIterable(["A1", "B1", "A2"],
      key: (ele) => ele[0]); // {A: A2, B: B1}
  var map3 = Map<String, int>.fromIterable(
    ["A1", "B1", "A2"],
    key: (ele) => ele[0],
    value: (ele) => int.tryParse(ele[1]) ?? -1,
  ); // {A: 2, B: 1}
  print("map1: $map1"); // map: {A: 1, B: 2, null: 4}
  print("map2: $map2"); // map: {A: 1, B: 2, null: 4}
  print("map3: $map3"); // map: {A: 1, B: 2, null: 4}

  // Map.identity
  var mapIdentity = Map<int, String>.identity();

  mapIdentity[1] = "A";
  mapIdentity[4] = "D";
  mapIdentity[2] = "B";
  mapIdentity[3] = "C";
  print("mapIdentity: $mapIdentity"); // mapIdentity: {1: A, 4: D, 2: B, 3: C}

  // Map.of
  var mapOfRes = {"A": 1, "B": 2};
  var mapOf = Map.of(mapOfRes);
  // mapOf.runtimeType: _InternalLinkedHashMap<String, int>, mapOf: {A: 1, B: 2}
  print("mapOf.runtimeType: ${mapOf.runtimeType}, mapOf: $mapOf");

  // Map.unmodifiable
  // mapUnmo.runtimeType: UnmodifiableMapView<String, int>, mapUnmo: {A: 1, B: 2}
  var mapUnmo = Map<String, int>.unmodifiable({"A": 1, "B": 2});
  // 如果尝试修改Map，会报错“Cannot modify unmodifiable map”，并导致程序crashed。
//  mapUnmo["C"] = 2;
  print("mapUnmo.runtimeType: ${mapUnmo.runtimeType}, mapUnmo: $mapUnmo");

  // 常用属性
  var mapProp = {"A": 1, "B": 2};

  // entries：获取Map的MapEntry的集合。
  // entriesProp: (MapEntry(A: 1), MapEntry(B: 2))
  Iterable<MapEntry<String, int>> entriesProp = mapProp.entries;
  print("entriesProp: $entriesProp");

  // isEmpty：判断Map是否为空。如果为空，返回true。否则，返回false。
  var isEmpty = mapProp.isEmpty; // false
  // 判断Map是否不为空。如果不为空，返回true。否则，返回false。
  var isNotEmpty = mapProp.isNotEmpty; // true
  // keys：获取Map的Key的集合。
  Iterable<String> keys = mapProp.keys; // (A, B)
  // 获取Map的value的集合。
  Iterable<int> values = mapProp.values; // (1, 2)

  print("keys: $keys");
  print("values: $values");

  // length：获取Map键/值对的个数。
  var length = mapProp.length; // length: 2
  print("length: $length");

  // 常用方法
  // operator []=：用于将key与给定值在Map中关联。
  // 如果键已经在Map中，则其关联值将更改。 否则，将键/值对将添加到Map。
  var mapOperAdd = {"A": 1, "B": 2};

  mapOperAdd["A"] = 10; // {A: 10, B: 2}
  mapOperAdd["C"] = 3; // {A: 10, B: 2, C: 3}
  print("mapOperAdd: $mapOperAdd");

  // addAll：用于将other中所有的键/值对添加到此Map。
  var mapAddAll1 = {"A": 1, "B": 2};
  var mapAddAll2 = {"A": 10, "C": 2};
  mapAddAll1.addAll(mapAddAll2); // {A: 10, B: 2, C: 2}
  print("mapAddAll1: $mapAddAll1");

  // addEntries
  var mapAddEntries = {"A": 1, "B": 2};
  // A: 10, B: 2, C: 3}
  mapAddEntries.addEntries({MapEntry("A", 10), MapEntry("C", 3)});
  print("mapAddEntries: $mapAddEntries");

  // putIfAbsent
  var mapPia = {"A": 1, "B": 2};
  var piaA = mapPia.putIfAbsent("A", () => -1); // mapPia: {A: 1, B: 2}, piaA: 1
  print("mapPia: $mapPia, piaA: $piaA");
  var piaC = mapPia.putIfAbsent(
      "C", () => -2); // mapPia: {A: 1, B: 2, C: -2}, piaC: -2
  print("mapPia: $mapPia, piaC: $piaC");

  // 转换操作

  // cast
  Map<String, num> mapCastRes = Map()
    ..["A"] = 1.0
    ..["B"] = 2.0;

  var mapCast = mapCastRes.cast<String, double>(); // {A: 1.0, B: 2.0}
  print("mapCast: $mapCast");

  // map
  var mapMapRes = {"1": 'A', "2": 'B'};
  var mapMap = mapMapRes.map((key, value) {
    return MapEntry(int?.tryParse(key) ?? -1, value.hashCode);
  }); // {1: 33620976, 2: 926182998}
  print("mapMap: $mapMap");
  
  // castFrom

  // 移除操作
  // clear
  var mapClear = {
    "A": 2,
    "B": 3
  }; // MapClear.length: 2, mapClear.isEmpty: false
  print(
      "mapClear.length: ${mapClear.length}, mapClear.isEmpty: ${mapClear.isEmpty}");
  mapClear.clear(); // mapClear.length: 0, mapClear.isEmpty: true
  print(
      "mapClear.length: ${mapClear.length}, mapClear.isEmpty: ${mapClear.isEmpty}");

  // remove
  var mapRemove = {"A": 2, "B": 3};
  var removeA = mapRemove.remove("A"); // mapRemove: {B: 3}, removeA: 2
  var removeC = mapRemove.remove("C"); // mapRemove: {B: 3}, removeC: null
  print("mapRemove: $mapRemove, removeA: $removeA");
  print("mapRemove: $mapRemove, removeC: $removeC");

  // removeWhere
  var mapRemoveWhere = {"A1": 2, "B1": 3, "A2": 4};
  mapRemoveWhere.removeWhere((key, value) {
    return key.startsWith("A");
  }); // mapRemoveWhere: {B1: 3}

  print("mapRemoveWhere: $mapRemoveWhere");
  // 判断是否存在键/值

  var mapContain = {"A": 2, "B": 3};
  // containsKey
  var containsA = mapContain.containsKey("A"); // true
  var containsC = mapContain.containsKey("C"); // false
  print("containsA: $containsA");
  print("containsC: $containsC");

  // containsValue
  var contains2 = mapContain.containsValue(2); // true
  var contains5 = mapContain.containsValue(5); // false
  print("contains2: $contains2");
  print("contains5: $contains5");

  // foreach
  var mapForeach = {"A": 2, "B": 3};
  // key: A, value: 2
  // key: B, value: 3
  mapForeach.forEach((key, value) {
    print("key: $key, value: $value");
  });

  // 更新Map的值
  // update
  var mapUpdate = {"A": 2, "B": 3};
  var valueNew = mapUpdate.update("A", (value) {
    return value * value;
  }); // mapUpdate: {A: 4, B: 3}, valueNew: 4
  print("mapUpdate: $mapUpdate, valueNew: $valueNew");

  var valueNewIf = mapUpdate.update("C", (value) {
    return value * value;
  }, ifAbsent: () => -1); // mapUpdate: {A: 4, B: 3, C: -1}, valueNewIf: -1
  print("mapUpdate: $mapUpdate, valueNewIf: $valueNewIf");

  // updateAll
  var mapUpdateAll = {"A": 2, "B": 3};
  mapUpdateAll.updateAll((key, value) {
    return value * value;
  }); // A: 4, B: 9}
  print("mapUpdateAll: $mapUpdateAll");
}
