import 'dart:math';

void main() {
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
  var reversed = listProp.reversed; // [4, 3, 2, 1]
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
  var getRange = listGetRange.getRange(1, 4); // [2, 3, 4]
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
  
  listSort.sort((a, b) => a.length.compareTo(b.length)); // [one, two, four, three] 或 [two, one, four, three]
  
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
  
  // 扩展
  
  // expand
  var listExp = [1, 2, 3];
  var expand = listExp.expand((item) => [item, item].toList()); // [1, 1, 2, 2, 3, 3]
  print("expand: $expand");
}
