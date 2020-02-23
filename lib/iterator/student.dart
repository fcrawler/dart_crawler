
class Student {
  final String name;
  final int age;

  Student(this.name, this.age);

  @override
  String toString() {
    return 'Student{name: $name, age: $age}';
  }
}