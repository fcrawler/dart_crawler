void main() {
//	// 抛出Exception类型异常
//	throw Exception("Expected at least 1 section");
//
//
//	// 抛出Exception的子类型FormatException异常
//	throw FormatException("Expected at least 1 section");
//
//	// 抛出自定义类型MyException异常
//	throw MyException("Expected at least 1 section");
//
//	// 可以抛出任意对象
//	// 抛出String类型
//	throw 'Out of llamas!';

  // catch
//  for (var num in [1, 2, 3, 4]) {
//    testException(num);
//  }
  // 堆栈轨迹
  StackTrace().testStackTrace();
}

void testException(int num) {
  try {
    switch (num) {
      case 1:
        throw FormatException("Expected at least 1 section");
        break;
      case 2:
        throw MyException("This is user-defined exception");
        break;
      default:
        throw Exception("This is custom exception");
        break;
    }
  } on FormatException {
    print("子句可以处理FormatException类型的抛出对象");
  } on MyException catch (e) {
    print("子句可以处理FormatException类型的抛出对象 runtimetype: ${e.runtimeType}");
//    rethrow;
  } catch (e) {
    // 子句可以处理任何类型的抛出对象
    print("子句可以处理任何类型的抛出对象 runtimetype: ${e.runtimeType}");
  } finally {
    print("finnally num: $num");
  }
}

class MyException implements Exception {
  final String message;

  MyException(this.message);
}

class StackTrace {
  void testStackTrace() {
    try {
      throw FormatException("Expected at least 1 section");
    } on FormatException catch(e, s) {
      print("testStackTrace 堆栈轨迹：\n$s ");
      print("testStackTrace exception: $e");
    }
  }
}