import 'student.dart';
import 'student_iterator.dart';
import 'students.dart';

void main() {
  // 迭代器
  StudentIterator studentIterator = StudentIterator()
    ..add(Student("teaphy", 16))
    ..add(Student("jony", 20));


  // 遍历迭代器
  while(studentIterator.moveNext()){
    print("${studentIterator.current}");
  }

  // 可迭代对象
  Students students = Students()
    ..add(Student("teaphy", 16))
    ..add(Student("jony", 21));

  // 可迭代对象
//  while(students.iterator.moveNext()){
//    print("${students.iterator.current}");
//  }

  for(Student student in students) {
    print("$student");
  }

  for (int index in naturalTo(5)) {
    print("index: $index");
  }
}

Iterable<int> naturalTo(n) sync* {
  var k = 0;
  while(k < n) yield k++;
}