import 'dart:math';

void main() {
  var person = Person("teaphy", 26, "man");
  var name = person.name;
  var age = person.age;
  person.greeting();
  print("name: $name, age: $age");

  // p没有初始化，此时值为null
  Person p;
  // 空安全操作符`?.`
  // 当`?.`前面的实例为null时，不执行`.`调用操作
  p?.greeting();
  p = Person("teaphy", 26, "man");
  // 当`?.`前面的实例不为null时，执行`.`调用操作
  p?.greeting();

  // 调用构造函数创建实例
  var p1 = Person("teaphy", 26, "man");
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

  // 调用非命名超类构造函数
//	var apple = Apple()
  // 调用非默认的超类构造函数

  // factory
  Shape circleShape = Shape("circle");
  Shape squareShape = Shape("square");

  print(
      "circleShape.area: ${circleShape.area.toStringAsFixed(2)}"); // circleShape.area: 12.57
  print("squareShape.area: ${squareShape.area}"); // squareShape.area: 4

  // 隐式接口
  Book englishBook = EnglishBook("英语口语");
  print("book.name: ${englishBook.getBookName()}"); // book.name: 英语口语

  // 重写
  // 重写类的成员
  Chinese chinese = Chinese();
  Language language = Chinese();
  chinese.printName(); // Chinese name: chinese
  language.printName(); // Chinese name: chinese
  chinese.setLevel(2); // Chinese level: 2
  language.setLevel(2); // Chinese level: 2
  
  // 重写操作符
  final v = Vector(2, 3);
  final w = Vector(2, 2);
  var vecPlus = v + w;
  var vecMinus = v - w;
  print("vecPlus: $vecPlus"); // vecPlus: Vector{x: 4, y: 5}
  print("vecMinus: $vecMinus"); // vecMinus: Vector{x: 0, y: 1}
  
  // 重写`noSuchMethod()`
//  NoSuchMethod noSuchMethod = NoSuchMethod();
//  noSuchMethod.aaa();

}

class Person {
  String name;
  int age;
  final String sex;

  Person(this.name, this.age, this.sex);

  Person.fromMap(Map<String, dynamic> map)
      : this.name = map["name"],
        this.age = map["age"],
        this.sex = "man";

  Person.justName(String name) : this(name, 18, "man");

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

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

class Fruit {
  String name;

  Fruit() {
    print("Fruit 无参构造函数");
  }

  Fruit.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
  }
}

class Apple extends Fruit {
  double price = 0.2;

  Apple() {
    print("Apple 无参构造函数");
  }

  Apple.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}

abstract class Shape {
  static final Map<String, Shape> _cache = <String, Shape>{};

  factory Shape(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    }

    switch (name) {
      case "circle":
        return Circle(2);
        break;
      case "square":
        return Square(2);
        break;
      default:
        throw Exception("no type for $name");
        break;
    }
  }

  num get area;
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;

  Square(this.side);

  num get area => pow(side, 2);
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

class Book {
  final String name;

  Book(this.name);

  String getBookName() {
    return this.name;
  }
}

class EnglishBook implements Book {
  final String _name;

  EnglishBook(this._name);

  @override
  String getBookName() {
    return this._name;
  }

  @override
  String get name => this._name;
}

class Language {
  String name;
  num level;

  Language(this.name, this.level);

  void printName() {
    print("Language name: $name");
  }

  void setLevel(num level) {
    this.level = level;
    print("Language level: $level");
  }
}

class Chinese extends Language {
  @override
  String name;

  @override
  covariant int level;

  Chinese()
      : this.name = "chinese",
        this.level = 1,
        super("", 0);

  @override
  void printName() {
    print("Chinese name: $name");
  }

  @override
  void setLevel(covariant int level) {
    this.level = level;
    print("Chinese level: $level");
  }
}

class Vector {
  final int x, y;
  
  Vector(this.x, this.y);
  
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
  
  @override
  String toString() {
    return 'Vector{x: $x, y: $y}';
  }
}

class NoSuchMethod {

  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

enum Color { red, green, blue }

abstract class Swimmer {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  factory Swimmer._() => null;
  
  void swim() {
    print("I'm swimming");
  }
}
