
import 'student.dart';
import 'student_iterator.dart';

/**
 * 可迭代对象
 */
class Students extends Iterable<Student> {

  // 迭代器
  StudentIterator _studentIterator = StudentIterator();

  @override
  StudentIterator get iterator => _studentIterator;

  int get length => _studentIterator.length;

  void add(Student student) {
    _studentIterator.add(student);
  }
}