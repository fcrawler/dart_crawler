void main() {
	var bat = Bat();
	bat.walk();
	bat.walkSpeed = 20;
	print("bat.speed: ${bat.speed}");
}

mixin Walker {
	
	num speed;

	void walk() {
		print("I'm walking");
	}
}

abstract class Animal {

}

abstract class Mammal {

}

class Bat extends Mammal with Walker {

	set walkSpeed(num s) => speed = s;
	
}