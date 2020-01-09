void main() {
  // 创建List
  List fixedLengthList = new List(3);
  var flen =
      fixedLengthList.length; // fixedLengthList: [null, null, null], flen: 3

  print("fixedLengthList: $fixedLengthList, flen: ${flen}");

  List growableList = new List();
  var glength = growableList.length; // growableList: [], fleglengthn: 0
  print("growableList: $growableList, fleglengthn: ${glength}");

  List growableList1 = List()..length = 3;
  var glength1 =
      growableList1.length; // growableList1: [null, null, null], glength1: 3
  growableList1.add(1); // growableList1: [null, null, null, 1], glength1: 4

  print("growableList1: $growableList1, glength1: ${glength1}");

  // List.filled
  var listFill = List<String>.filled(3, "A"); // listFill: [A, A, A], length: 3
  print("listFill: $listFill, length: ${listFill.length}");

  var listFill1 = List<String>.filled(3, "A",
      growable: true); // listFill1: [A, A, A], length: 3
  print("listFill1: $listFill1, length: ${listFill1.length}");
  listFill1.add("B"); // listFill1: [A, A, A, B], length: 4
  print("listFill1: $listFill1, length: ${listFill1.length}");

  var listFill2 = List<String>.filled(3, "A", growable: true)
    ..length = 5; // listFill2: [A, A, A, null, null], length: 5
  print("listFill2: $listFill2, length: ${listFill2.length}");

  // List.generate
  var listGenerate = List.generate(4, (index) => index * index); // listGenerate: [0, 1, 4, 9], length: 4
  print("listGenerate: $listGenerate, length: ${listGenerate.length}");

  // index
  var list = [1, 2, 3];
//	var first = list[0]; // 1
//	var last = list[list.length -1]; // 3

//	print("first: ${first}");
//	print("last: ${last}");

  // 常量List
  var constantList = const [1, 2, 3];

  // 扩展操作符
  var list1 = [1, 2, 3];
  var list2 = [0, ...list]; // [0, 1, 2, 3]
  print("list2: $list2");

  var list3;
  var list4 = [0, ...?list3]; // [0]
  print("list4: $list4");

  // collection if

  var active = false;

  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (active) 'Outlet'
  ]; // [Home, Furniture, Plants]

  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (!active) 'Outlet'
  ]; // [Home, Furniture, Plants, Outlet]

  print("nav: $nav");
  print("nav2: $nav2");

  var listOfInts = [1, 2, 3];
  var listOfString = ["#0", for (var i in listOfInts) "#$i"]; //[#0, #1, #2, #3]

  print("listOfString: $listOfString");

  // 常用属性
  var listProp = [1, 2, 3, 4];
  var listSingle = ["A"];

  var first = listProp.first; // 1
  var last = listProp.last; // 4
  var length = listProp.length; // 4
  Iterable reversed = listProp.reversed; // (4, 3, 2, 1)
  var isEmpty = listProp.isEmpty; // false
  var isNotEmpty = listProp.isNotEmpty; // true
  var single = listSingle.single; // A
  var runtimeType = listProp.runtimeType; // List<int>

  print("first: $first");
  print("last: $last");
  print("length: $length");
  print("reversed: $reversed");
  print("isEmpty: $isEmpty");
  print("isNotEmpty: $isNotEmpty");
  print("single: $single");
  print("runtimeType: $runtimeType");

  // 添加元素
  var listAdd = List<int>();
  listAdd.add(0); // [0]
  listAdd.addAll([1, 2, 3, 4]); // [0, 1, 2, 3, 4]
  print("listAdd: $listAdd");

  // asMap
  var listAsMap = ["A", "B", "C"];
  Map<int, String> asMap = listAsMap.asMap(); // {0: A, 1: B, 2: C}
  print("asMap: $asMap");

  var listCast = List<num>();
  listCast.add(1);
  listCast.add(2);
  listCast.add(3);

  var cast = listCast.cast<int>(); // [1, 2, 3]
  print("cast: $cast");

  // clear
  var listClear = ["A", "B"];
  listClear.clear();
  print("listClear: $listClear"); // []

  // fillRange

  var listFillRange = [1, 2, 3, 4, 5, 6];
  listFillRange.fillRange(1, 4, -1); // [1, -1, -1, -1, 5, 6]
  print("listFillRange: $listFillRange");

  // getRange

  var listGetRange = [1, 2, 3, 4, 5, 6];
  Iterable getRange = listGetRange.getRange(1, 4); // (2, 3, 4)
  print("getRange: $getRange");

  // indexOf
  List<String> listIndex = ['aaa', 'bbb', 'ccc', 'aaa', 'ddd'];
  var if0 = listIndex.indexOf('aaa'); // 3
  var if1 = listIndex.indexOf('aaa', 2); // 0

  var iw0 = listIndex.indexWhere((ele) {
    return ele == "aaa";
  }); // 3
  var iw1 = listIndex.indexWhere((ele) {
    return ele == "aaa";
  }, 2); // 0
  var iw2 = listIndex.indexWhere((ele) {
    return ele == "bbb";
  }, 2); // 1

  var lif0 = listIndex.lastIndexOf("aaa");
  var lif1 = listIndex.lastIndexOf("aaa", 2);
  var liw0 = listIndex.lastIndexWhere((ele) {
    return ele == "aaa";
  }); // 3
  var liw1 = listIndex.lastIndexWhere((ele) {
    return ele == "aaa";
  }, 2); // 0
  var liw2 = listIndex.lastIndexWhere((ele) {
    return ele == "ddd";
  }, 2); // -1

  print("if0: $if0");
  print("if1: $if1");

  print("iw0: $iw0");
  print("iw1: $iw1");
  print("iw2: $iw2");

  print("lif0: $lif0");
  print("lif1: $lif1");

  print("liw0: $liw0");
  print("liw1: $liw1");
  print("liw2: $liw2");

  // insert

  var listInsert = [1, 2, 3];

  listInsert.insert(1, 10); // [1, 10, 2, 3]

  print("listInsert: $listInsert");

  listInsert.insertAll(2, [11, 12, 13]); // [1, 10, 11, 12, 13, 2, 3]
  print("listInsert: $listInsert");

  // 移除元素

  var listRemove = ["A", "B", "C", "D", "E", "F"];

  // remove
//  var rA = listRemove.remove("A"); // true, listRemove: [B, C, D, E, F]
//  print("rA: $rA, listRemove: $listRemove");
//  var rH = listRemove.remove("H"); // false, listRemove: [B, C, D, E, F]
//  print("rH: $rH, listRemove: $listRemove");

  // removeAt
//  var itemRemove = listRemove.removeAt(2); // C, listRemove: [A, B, D, E, F]
//  print("itemRemove: $itemRemove, listRemove: $listRemove");

  // removeLast
//    var remLast = listRemove.removeLast(); // F, listRemove: [A, B, C, D, E]
//    print("itemRemove: $remLast, listRemove: $listRemove");

  //  removeRange
//  listRemove.removeRange(1, 4); // [A, E, F]
//  print("listRemove: $listRemove");

  // removeWhere
//  listRemove.removeWhere((item) => item.compareTo("C") > 0); // [A, B, C]
//  print("listRemove: $listRemove");

  // retainWhere
//  listRemove.retainWhere((item) => item.compareTo("C") > 0); // [D, E, F]
//  print("listRemove: $listRemove");

  // 替换
  var listReplace = [1, 2, 3, 4, 5, 6];

  // replaceRange
//  listReplace.replaceRange(1, 4,
//      [10, 11, 12, 13, 14, 15, 16]); // [1, 10, 11, 12, 13, 14, 15, 16, 5, 6]

  // setAll
//  listReplace.setAll(1, [10, 11, 12]); // [1, 10, 11, 12, 5, 6]

  // setRange
//  var listReplace2 = [10, 11, 12, 13, 14, 15, 16];
//  listReplace.setRange(1, 4, listReplace2, 2); // [1, 12, 13, 14, 5, 6]

  print("listReplace: $listReplace");

  // shuffle
  var listShuffle = [1, 2, 3, 4, 5, 6];

  // 随机调整顺序，每次执行的结果可能不一样。
//  listShuffle.shuffle(); // [6, 4, 3, 5, 2, 1]
  listShuffle.shuffle();
  print("listShuffle: $listShuffle");

  // sort
  var listSort = ["one", "two", "three", "four"];
//  listSort.sort(); // [four, one, three, two]

  listSort.sort((a, b) => a.length.compareTo(
      b.length)); // [one, two, four, three] 或 [two, one, four, three]

  print("listSort: $listSort");

  // subList
  var listSub = [1, 2, 3, 4, 5, 6];
  var listSub1 = listSub.sublist(1); // [2, 3, 4, 5, 6]
  var listSub2 = listSub.sublist(1, 4); // [2, 3, 4]

  print("listSub1: $listSub1");
  print("listSub2: $listSub2");

  // 判断元素是否存在
  // any
  var listExist = [1, 2, 3, 4, 5, 6];
  var any1 = listExist.any((item) => item > 4); // true
  var any2 = listExist.any((item) => item > 7); // false
  print("any1: $any1");
  print("any2: $any2");

  // contains
  listExist.contains(3); // true

  // every
  var every1 = listExist.every((item) => item > 2); // false
  var every2 = listExist.every((item) => item > 0); // true
  print("every1: $every1");
  print("every2: $every2");

  // 获取元素
  var listEle = ["A", "B", "C"];
  // elementAt
  var ele = listEle.elementAt(1); // "B"
  print("ele: $ele");

  // firstWhere
  var fw1 =
      listEle.firstWhere((item) => item == "A", orElse: () => "None"); // "A"
  var fw2 =
      listEle.firstWhere((item) => item == "F", orElse: () => "None"); // "None"
  print("fw1: $fw1");
  print("fw2: $fw2");

  // lastWhere
  var listLastW = ["A1", "B1", "B2", "A2", "B4"];
  var lw1 = listLastW.lastWhere((item) => item.startsWith("A"),
      orElse: () => "None"); // "A2"
  var lw2 = listLastW.lastWhere((item) => item.startsWith("F"),
      orElse: () => "None"); // "None"
  print("lw1: $lw1");
  print("lw2: $lw2");

  // singleWhere
  var listSingleWhere = ["A1", "A2", "B1", "B2", "C1"];
  var sw1 = listSingleWhere.singleWhere((ele) => ele.startsWith("C"),
      orElse: () => "None"); // "C1"
  var sw2 = listSingleWhere.singleWhere((ele) => ele.startsWith("F"),
      orElse: () => "None"); // None
  print("sw1: $sw1");
  print("sw2: $sw2");

  // 惰性求值
  // 扩展

  // expand
  var listExp = [1, 2, 3];
  Iterable expand =
      listExp.expand((item) => [item, item].toList()); // (1, 1, 2, 2, 3, 3)
  print("expand: $expand");

  // followedBy
  var listFb1 = [1, 2, 3];
  var listFb2 = [-1, -2, -3];
  Iterable followedBy = listFb1.followedBy(listFb2); // (1, 2, 3, -1, -2, -3)
  print("followedBy: $followedBy");

  // map
  var listMap = [1, 2, 3];
  var map = listMap.map((ele) => "A$ele"); // [A1, A2, A3]
  print("map: $map");

  // skip
  var listSkip = [1, 2, 3, 4];
  Iterable skip1 = listSkip.skip(2); // (3, 4)
  Iterable skip2 = listSkip.skip(4); // ()
  print("skip1: $skip1");
  print("skip2: $skip2");

  // take
  var listTake = [1, 2, 3, 4];
  Iterable take1 = listTake.take(2); // take1: (1, 2), length: 2
  Iterable take2 = listTake.take(6); // take2: (1, 2, 3, 4), length: 4
  print("take1: $take1, length: ${take1.length}");
  print("take2: $take2, length: ${take2.length}");

  // takeWhile
  var listTakeWhile = ["A1", "A2", "B1", "B2", "C1"];
  var takeWhile1 =
      listTakeWhile.takeWhile((ele) => ele.startsWith("A")); // ["A1", "A2"]
  var takeWhile2 = listTakeWhile.takeWhile((ele) => ele.startsWith("F")); // []
  print("takeWhile1: $takeWhile1");
  print("takeWhile2: $takeWhile2");

  // toList
  var listToL = [1, 2, 3];
  var ltl1 = listToL.toList(); // [1, 2, 3]
  var ltl2 = listToL.toList(growable: false); // [1, 2, 3]

  print("ltl1: $ltl1");
  print("ltl2: $ltl2");

  // toSet
  var listSet = [1, 2, 3, 1, 2];
  var set = listSet.toSet(); // {1, 2, 3}
  print("set: $set");

  // where
  var listWhere = [1, 2, 3];
  Iterable<int> lw = listWhere.where((ele) => ele > 1); // (2, 3)
  print("lw: $lw");

  // whereType
  List<Object> listWt = [1, 2, "A", "B", true, false];
  Iterable whereType = listWt.whereType<int>(); // (1, 2)
  print("whereType: $whereType");

  // 及早求值

  // fold
  var listFold = [1, 2, 3, 4];
  var fold = listFold.fold(0, (pre, ele) => pre + ele); // 10
  print("fold: $fold");

  //join
  var listJoin = [1, 2, 3, 4];
  var join = listJoin.join(","); //1,2,3,4
  print("join: $join");

  // 终端操作

  // forEach
  var listTerminal = [1, 2, 3];
  // ele: 1
  // ele: 2
  // ele: 3
  listTerminal.forEach((ele) => print("ele: $ele"));

  // reduce
  var listReduce = [1, 2, 3, 4];

  var reduce = listReduce.reduce((pre, ele) => pre * ele); // 24
  print("reduce: $reduce");

  // operate
  // +
  var listPlus1 = [1, 2, 3];
  var listPlus2 = [11, 12, 13];
  var listPlus = listPlus1 + listPlus2; // [1, 2, 3, 11, 12, 13]

  print("listPlus: $listPlus");

  // ==
  var listEqu1 = [1, 2, 3];
  var listEqu2 = [1, 2, 3];
  var equ1 = listEqu1 == listEqu1; // true
  var equ2 = listEqu1 == listEqu2; // false

  print("equ1: $equ1");
  print("equ2: $equ2");

  // []
  var listOpe1 = [1, 2, 3];
  var eleOne = listOpe1[1]; // 2
  print("eleOne: $eleOne");

  // []=
  listOpe1[1] = 4; // 1, 4, 3]
  print("listOpe1: $listOpe1");

  // castFrom
  List<Object> listObj = [1, 2.6, 3, 1.4];
  List<num> listCastFrom = List.castFrom(
      listObj); // listCastFrom: [1, 2.6, 3, 1.4], listObj == listCastFrom = false
  print(
      "listCastFrom: $listCastFrom, listObj == listCastFrom = ${listCastFrom == listObj}");

  // copyRange
  var listTar = [1, 2, 3, 4, 5, 6];
  var listSou = [11, 12, 13];
  List.copyRange(listTar, 1, listSou); // [1, 11, 12, 13, 5, 6]
  print("listTar: $listTar");

  // writeIterable
  var listWriteTar = [1, 2, 3, 4, 5, 6];
  Iterable iterableSou = {11, 12, 13};
  List.writeIterable(listWriteTar, 1, iterableSou); // [1, 11, 12, 13, 5, 6]
  print("listWriteTar: $listWriteTar");
}
