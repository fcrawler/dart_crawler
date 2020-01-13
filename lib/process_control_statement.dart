void main() {
  // Dart支持带有可选else语句的if语句。
  var age = 10;
  if (age > 20) {
    print("age > 20");
  } else if (age <= 20 && age > 10) {
    print("age <= 20 && age > 10");
  } else {
    print("age <= 10");
  }

  // 标准for循环
  for (var i = 0; i < 5; i++) {
    print("i: $i");
  }

  var listForEach = [1, 2, 3];
  listForEach.forEach((ele) => print("ele: $ele"));

  for (var value in listForEach) {
    print("value: $value");
  }

  var isDone = 0;
  while (isDone < 5) {
    print("isDone: $isDone");
    isDone++;
  }
  
  isDone = 0;
  do {
    print("isDone: $isDone");
    isDone++;
  } while (isDone < 5);

  for (int i = 0; i < 5; i++) {
	  print("i: $i");
	  if (i > 2) {
		  break;
	  }
  }

  for (int i = 0; i < 5; i++) {
	  if (i < 2) {
		  continue;
	  }
	  print("i: $i");
  }
}
