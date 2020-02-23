class Person {
  int age;
  String name;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Person{age: $age, name: $name}';
  }
  
  
}