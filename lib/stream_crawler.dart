import 'dart:async';
import 'dart:math';

import 'future.dart';

void testTimeCounter() async {
  Stream timeStream = timeCounter(Duration(seconds: 1));
  StreamSubscription<int> ss;

  int count;

  ss = timeStream.listen((data) {
    count = data;
    print("data: $data");
  });

  await Future.delayed(Duration(seconds: 5));
  // 暂停
  print("pause - count: $count");
  ss.pause();

  await Future.delayed(Duration(seconds: 3));
  // 重新启动
  print("resume - count: $count");
  ss.resume();

  await Future.delayed(Duration(seconds: 3));
  print("onDone - count: $count");
  ss.onDone(() => print("on done"));
  print("cancel - count: $count");
  ss.cancel();
}

void testIncrementCounter() async {
  Stream timeStream = incrementCounter(Duration(seconds: 1));
  StreamSubscription<int> ss;

  int count;

  ss = timeStream.listen((data) {
    count = data;
    print("data: $data");
  });

  await Future.delayed(Duration(seconds: 5));
  // 暂停
  print("pause - count: $count");
  ss.pause();

  await Future.delayed(Duration(seconds: 3));
  // 重新启动
  print("resume - count: $count");
  ss.resume();

  await Future.delayed(Duration(seconds: 4));
  print("cancel - count: $count");
  ss.cancel();
}

// 使用 async *函数 从头创建 Stream
Stream<int> timeCounter(Duration duration) async* {
  int count = 0;
  while (true) {
    count++;
    yield count;
    await Future.delayed(duration);
  }
}

// 转换现有Stream
Stream<String> convertInt(Stream<int> source) async* {
  String pre = 'A';
  await for (int data in source) {
    yield "A-$data";
  }
}

//使用StreamController创建Stream
Stream<int> incrementCounter(Duration duration, [int maxCount]) {
  StreamController streamController;

  Timer timer;

  int count = 0;

  void increment(Timer t) {
    count++;
    streamController?.sink?.add(count);
    if (null != maxCount && count == maxCount) {
      timer?.cancel();
      streamController?.close();
    }
  }

  void startTimber() {
    timer = Timer.periodic(duration, increment);
  }

  void stopTimber() {
    timer?.cancel();
    timer = null;
  }

  void onListen() {
    print("onListen");
    startTimber();
  }

  void onPause() {
    print("onPause");
    stopTimber();
  }

  void onResume() {
    print("onResume");
    startTimber();
  }

  void onCancel() {
    print("onCancel");
    stopTimber();
  }

  streamController = StreamController<int>(
      onListen: onListen,
      onPause: onPause,
      onResume: onResume,
      onCancel: onCancel);

  return streamController.stream;
}

// 使用构造函数
void testEmpty() {
  Stream<int> stream = Stream<int>.empty();

  stream.listen((data) {
    print("data: $data");
  }, onDone: () => print("on done"));
}

void testError() async {
  Stream<int> errorStream = Stream<int>.error("This is a error");

  try {
    await for (int data in errorStream) {
      print("data: $data");
    }
  } catch (e) {
    print(e);
  }
}

void testEventTransformed() async {
  var data = [1, 2, 3];
  var source = Stream.fromIterable(data);
  Stream<int> ets =
      Stream<int>.eventTransformed(source, (sink) => StringSink(sink));

  try {
    await for (int data in ets) {
      print("data: $data");
    }
  } catch (e) {
    print("error: $e");
  }
}

class StringSink implements EventSink<int> {
  final EventSink<int> _outputSink;

  StringSink(this._outputSink);

  @override
  void add(int event) {
    _outputSink.add(event * 2);
    _outputSink.add(event * 2);
  }

  @override
  void addError(Object error, [StackTrace stackTrace]) {
    _outputSink.addError(error, stackTrace);
  }

  @override
  void close() {
    _outputSink.close();
  }
}

void testFromFuture() {
  Future<int> f = Future.delayed(Duration(seconds: 3), () => 3);
  Stream<int> stream = Stream<int>.fromFuture(f);
  stream.listen((data) => print("data: $data"), onDone: () => print("on done"));
}

void testFromFutures() {
  Future<String> f1 = Future.delayed(Duration(seconds: 1), () => "I'm from f1");
  Future<String> f2 = Future.delayed(Duration(seconds: 2), () => "I'm from f2");
  Future<String> f3 = Future.delayed(Duration(seconds: 3), () => "I'm from f3");
  Stream<String> stream = Stream<String>.fromFutures([f1, f2, f3]);
  stream.listen((data) => print("data: $data"), onDone: () => print("on done"));
}

void testFromIterable() {
  var list = [1, 2, 3];

  Stream<int> stream = Stream<int>.fromIterable(list);
  stream.listen((data) => print("data: $data"), onDone: () => print("on done"));
}

void testPeriodic() {
  Stream<String> stream =
      Stream<String>.periodic(Duration(seconds: 1), (count) => "A - $count");
  stream.listen((data) => print("data: $data"), onDone: () => print("on done"));
}

void testValue() {
  Stream<String> stream = Stream<String>.value("I'm a single value Stream");
  stream.listen((data) => print("data: $data"), onDone: () => print("on done"));
}

void testAsBroadcast() {
  var list = [1, 2, 3];
  // 单一订阅Stream
  Stream<int> stream = Stream<int>.fromIterable(list);
  Stream<int> sab = stream.asBroadcastStream();
  var sub1 = sab.listen((data) => print("data: $data"),
      onDone: () => print("on done"));
  var sub2 = sab.listen((data) => print("data: $data"),
      onDone: () => print("on done"));
}

void testAny() async {
  Stream<int> stream =
      Stream<int>.periodic(Duration(seconds: 1), (count) => count);

  Future<bool> aa = stream.any((ele) => ele > 2);

  bool bb = await aa;
  print("bb: $bb");
}

void testExpand() {
  var list = [1, 2, 3];
  Stream<int>.fromIterable(list).expand((ele) {
    var listData = List<String>();

    for (int i = 0; i < ele; i++) {
      listData.add("A - $i");
    }

    return listData;
  }).listen((data) => print("data: $data"));
}

void testEsyncExpand() {
  Stream<int> stream =
      Stream<int>.periodic(Duration(seconds: 1), (count) => count);
  Stream<String> str =
      stream.asyncExpand<String>((ele) => Stream.value("A - $ele"));

  str.listen((data) => print("data: $data"));
}

void testAsyncMapMap() {
  var list = [1, 2, 3];
  Stream<int>.fromIterable(list)
      .asyncMap((ele) => Future.delayed(Duration(seconds: 1), () => "A - $ele"))
      .listen((data) => print("data: $data"));
}

void testDistinct() {
  var list = ["A1", "B1", "C1", "A2", "A3", "B2", "B3", "C2"];
  Stream<String>.fromIterable(list)
      .distinct((String pre, String next) => pre[0] == next[0])
      .listen((data) => print("data: $data"));
}

void testDrain() async {
  var stream = Stream.periodic(Duration(seconds: 1), (ele) => "A - $ele")
      .take(3)
      .asBroadcastStream();
  var fValue = await stream.drain("drain all datas");
  print("fValue: $fValue");
}

void testElementAt() async {
  var stream = Stream.periodic(Duration(seconds: 1), (ele) => "A - $ele");
  Future<String> future = stream.elementAt(3);
  String value = await future;
  print("value: $value");
}

void testFirstWhere() async {
  var list = [1, 2, 3];
  Future<int> future = Stream<int>.fromIterable(list)
      .firstWhere((ele) => ele > 1, orElse: () => -1);
  int value = await future;
  print("value: $value");
}

void testFold() async {
  List<Price> listPrice = [
    Price("apple", 10),
    Price("orange", 20),
    Price("banana", 30)
  ];
  Future<int> future = Stream<Price>.fromIterable(listPrice)
      .fold<int>(0, (pre, ele) => pre + ele.price);

  int value = await future;
  print("value: $value");
}

class Price {
  final String name;
  final int price;

  Price(this.name, this.price);
}

void testForEach() async {
  Stream.periodic(Duration(seconds: 1), (count) => count)
      .forEach((ele) => print("ele: $ele"));
}

void testHandleError() async {
  Future<String> f1 = Future.delayed(Duration(seconds: 1), () => "I'm from f1");
  Future<String> f2 = Future.delayed(Duration(seconds: 2), () => "I'm from f2");
  Future<String> fError = Future.delayed(Duration(seconds: 3),
      () => Future<String>.error("This is a error future"));
  Future<String> f3 = Future.delayed(Duration(seconds: 4), () => "I'm from f3");
  Stream<String> stream = Stream<String>.fromFutures([f1, fError, f2, f3]);
  stream
      .handleError((error) => print("handle error: $error"))
      .listen((data) => print("data: $data"), onDone: () => print("on done"));
}

void testJoin() async {
  var list = [1, 2, 3];

  Future<String> future = Stream.fromIterable(list).join("_");

  String value = await future;
  print("value: $value");
}

void testLastWhere() async {
  var list = [1, 2, 3];
  Future<int> future = Stream<int>.fromIterable(list)
      .lastWhere((ele) => ele % 2 != 0, orElse: () => -1);
  int value = await future;
  print("value: $value");
}

void testListen() async {
  Future<String> f1 = Future.delayed(Duration(seconds: 1), () => "I'm from f1");
  Future<String> f2 = Future.delayed(Duration(seconds: 2), () => "I'm from f2");
  Future<String> fError = Future.delayed(Duration(seconds: 3),
      () => Future<String>.error("This is a error future"));
  Future<String> f3 = Future.delayed(Duration(seconds: 4), () => "I'm from f3");
  Stream<String> stream = Stream<String>.fromFutures([f1, fError, f2, f3]);
  stream.listen((data) => print("data: $data"),
      onError: ((error) => print("onError: $error")),
      onDone: () => print("on done"),
      cancelOnError: true);
}

void testPipe() {
  var stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  final controller1 = new StreamController();
  final controller2 = new StreamController();

  controller1.addStream(stream);

  final doubler = new StreamTransformer.fromHandlers(handleData: (data, sink) {
    sink.add(data * 2);
  });

  controller1.stream.transform(doubler).pipe(controller2);
  controller2.stream.listen((data) => print(data));
}

void testReduce() async {
  var list = [WorkTime("A", 10), WorkTime("B", 14), WorkTime("C", 6)];
  Future<WorkTime> future = Stream<WorkTime>.fromIterable(list)
      .reduce((pre, ele) => WorkTime("total", pre.time + ele.time));
  var value = await future;
  print("value: $value");
}

class WorkTime {
  final String type;
  final int time;

  WorkTime(this.type, this.time);

  @override
  String toString() {
    return 'WorkTime{type: $type, time: $time}';
  }
}

void testSingleWhere() async {
  var list = ["A1", "A2", "B1", "C1", "C2"];

  Future<String> future = Stream<String>.fromIterable(list)
      .singleWhere((ele) => ele.startsWith("B"), orElse: () => "-1");

  var value = await future;
  print("value: $value");
}

void testSkip() async {
  Stream<int> stream =
      Stream<int>.periodic(Duration(seconds: 1), (count) => count).skip(3);
  stream.listen((data) => print("data: $data"),
      onError: ((error) => print("onError: $error")),
      onDone: () => print("on done"),
      cancelOnError: true);
}

void testTake() async {
  Stream<int> stream =
      Stream<int>.periodic(Duration(seconds: 1), (count) => count).take(3);
  stream.listen((data) => print("data: $data"),
      onError: ((error) => print("onError: $error")),
      onDone: () => print("on done"),
      cancelOnError: true);
}

void testTimeOut() async {
  Stream<int>.periodic(Duration(seconds: 2), (count) => count)
      .take(3)
      .timeout(Duration(seconds: 1), onTimeout: (sink) => sink.add(-1))
      .listen((data) => print("data: $data"),
          onDone: () => print("on done"), cancelOnError: true);
}

void testTransform() {
  StreamController sc = StreamController<int>();

  // 创建 StreamTransformer对象
  StreamTransformer stf = StreamTransformer<int, double>.fromHandlers(
    handleData: (int data, EventSink sink) {
      // 操作数据后，转换为 double 类型
      sink.add((data * 2).toDouble());
    },
    handleError: (error, stacktrace, sink) {
      sink.addError('wrong: $error');
    },
    handleDone: (sink) {
      sink.close();
    },
  );

  // 调用流的transform方法，传入转换对象
  Stream stream = sc.stream.transform(stf);

  stream.listen(print);

  // 添加数据，这里的类型是int
  sc.add(1);
  sc.add(2);
  sc.add(3);

  // 调用后，触发handleDone回调
  // sc.close();
}

void testWhere() {
  Stream<int>.periodic(Duration(seconds: 1), (count) => count)
      .take(6)
      .where((ele) => ele % 2 == 0)
      .listen((data) => print("data: $data"));
}

void main() {
  Stream timeStream = timeCounter(Duration(seconds: 1));

  // 使用 async *函数 从头创建 Stream
//  StreamSubscription<int> aa;
//  aa = timeStream.listen((data) {
//    print("data: $data");
//    if (data >= 5) {
//      aa.cancel();
//    }
//  });

  // 转换现有Stream
//  Stream<String> intToString = convertInt(timeStream);
//  intToString.listen((data) {
//    print("data: $data");
//  });

//  testTimeCounter();

  // 使用StreamController创建Stream
//  testIncrementCounter();

  // 构造函数
//  testEmpty();
//  testError();
//  testEventTransformed();
//  testFromFuture();
//  testFromFutures();
//  testFromIterable();
//  testPeriodic();
//  testValue();
//  testAsBroadcast();

//  testAny();
//  testExpand();
//  testEsyncExpand();
//  testAsyncMapMap();
//  testDistinct();
//  testDrain();
//  testElementAt();
//  testFirstWhere();
//  testFold();
//  testForEach();
//  testHandleError();
//  testJoin();
//  testLastWhere();
//  testListen();
//  testPipe();
//  testReduce();
//  testSingleWhere();
//  testSkip();
//  testTake();
//  testTimeOut();
//  testTransform();
  testWhere();
}
