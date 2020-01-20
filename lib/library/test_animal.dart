import 'animal.dart';

class Dog extends Animal with Run{

}

class Pig extends Animal with Run{

}

void main() {
	
	var dog = Dog();
	var pig = Pig();
	
	push(dog);
	push(pig);
	
}