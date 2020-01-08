void main() {
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
	Iterable iterableSou = {11, 12,13};
  List.writeIterable(listWriteTar, 1, iterableSou); // [1, 11, 12, 13, 5, 6]
  print("listWriteTar: $listWriteTar");
}
