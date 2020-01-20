library animal;


var _cache = <Animal>[];

void push(Animal animal) {
  _cache.add(animal);
}

abstract class Animal {}

abstract class Run {
  void doRun() {
    print("run");
  }
}
