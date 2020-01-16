void main() {
	var person = Person("teaphy", 26);
	var name = person.name;
	var age = person.age;
	person.greeting();
	print("name: $name, age: $age");
	
	// p没有初始化，此时值为null
	Person p;
	// 空安全操作符`?.`
	// 当`?.`前面的实例为null时，不执行`.`调用操作
	p?.greeting();
	p = Person("teaphy", 26);
	// 当`?.`前面的实例不为null时，执行`.`调用操作
	p?.greeting();
	
	// 调用构造函数创建实例
	var p1 = Person("teaphy", 26);
	var p2 = Person.fromMap({"name": "teaphy", "age": 25});
	
	
	// 常量构造函数
	var pConst = const Point(0.1, 0.5);
	
	
	var pConst1 = const Point(0.1, 0.5);
	var pConst2 = const Point(0.1, 0.5);
	var pConst3 = const Point(0.2, 0.6);
	
	print("pConst1: $pConst1"); // pConst1: Point{x: 0.1, y: 0.5}
	print("pConst2: $pConst2"); // pConst2: Point{x: 0.1, y: 0.5}
	print("pConst3: $pConst3"); // pConst3: Point{x: 0.2, y: 0.6}
	print("${identical(pConst1, pConst2)}"); // true
	print("${identical(pConst1, pConst3)}"); // false
	
	// 对象类型
	var pType = const Point(0.1, 0.5);
	Type type = pType.runtimeType; // Point
	print("type: $type");
	
	// 实例变量
	
}

class Person {
	String name;
	int age;
	
	Person(this.name, this.age);
	
	Person.fromMap(Map<String, dynamic> map):
				this.name = map["name"],
				this.age = map["age"];
	
	
	void greeting() {
		print("I'm teaphy and I'm age years old");
	}
}

class Point {
	final double x;
	final double y;
	
	const Point(this.x, this.y);
	
	@override
	String toString() {
		return 'Point{x: $x, y: $y}';
	}
	
	
}




