
import 'student.dart';

/**
 * 迭代器
 */
class StudentIterator extends Iterator<Student> {
  List<Student> _list = List<Student>();

  int _currentIndex = -1;

  StudentIterator(){
    _currentIndex = -1;
  }

  @override
  Student get current => _list[_currentIndex];

  int get length => _list.length;

  @override
  bool moveNext() {
    return ++_currentIndex < _list.length;
  }

  void add(Student student) {
    _list.add(student);
  }
}
