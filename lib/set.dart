void main() {
	
	// 声明一个Set
	var levelSet = {"A", "B", "C"};
	
	// 创建一个空 Set
	var empSet1 = <String>{};
	Set<String> empSet2 = {};
	
	// 添加元素
	var addRes = {1, 2, 3};
	var addList = [4, 5, 6];
	
	var addSet = <int>{};
	addSet.add(0);
	addSet.addAll(addRes);
	addSet.addAll(addList);
	
	print("addSet: $addSet"); // {0, 1, 2, 3, 4, 5, 6}
	
	// 获取长度
	var lenSet1 = {1, 2, 3, 4};
	var lenSet2 = {};
	
	print("lenSet1.length: ${lenSet1.length}"); // 4
	print("lenSet2.length: ${lenSet2.length}"); // 0
	
}