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
	var listOfString = [
		"#0",
		for(var i in listOfInts) "#$i"
	]; //[#0, #1, #2, #3]
	
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
	List<String> listIndexOf = ['aaa', 'bbb', 'ccc', 'aaa', 'ddd'];
	var if0 = listIndexOf.indexOf('aaa');    // 0
	var if1 = listIndexOf.indexOf('aaa', 2); // 3
	print("if0: $if0");
	print("if1: $if1");
}
