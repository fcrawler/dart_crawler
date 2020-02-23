int count = 0;

void main() {
//  any1();

//  Future.doWhile(testDoWhile);
//  Future.forEach([1, 2,3], delayPrint);
  Future.wait([delay3(), delay5()])
      .then((value) => print("value: $value"));

}

void any() {
  Future.any([delay3(), delay5()]).then((value) => print("value: $value"));
}

void any1() {
  Future.any([delay5(), error()])
      .then((value) => print("value: $value"))
      .catchError((e) => print("error: $e"));
}

Future delayPrint(int id) async {
  await Future.delayed(Duration(seconds: 2));
  print("id: $id");
}

Future<int> delay3() async {
  await Future.delayed(Duration(seconds: 3));
  return 3;
}

Future<int> delay5() async {
  await Future.delayed(Duration(seconds: 5));
  return 5;
}

Future<int> error() async {
  await Future.delayed(Duration(seconds: 4));

  return throw Exception("test error");
}

Future<bool> testDoWhile() async {
  await Future.delayed(Duration(seconds: 2));

  count++;

  print("testDoWhile -count:$count");

  if (count > 3) {
    return false;
  }

  return true;
}
