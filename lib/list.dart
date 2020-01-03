void main() {

	// index
	var list = [1, 2, 3];
	var first = list[0]; // 1
	var last = list[list.length -1]; // 3
	
	print("first: ${first}");
	print("last: ${last}");
	
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
}
