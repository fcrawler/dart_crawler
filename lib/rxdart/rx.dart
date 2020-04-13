import 'package:rxdart/rxdart.dart';

import '../future.dart';

void main() {
//  testCombineLatest();

//  testCombineLatestList();

//  textConcat();

//  testConcatEager();

//  testDefer();

//  testForkJoin();

//  testMerge();

  testRace();

//  testRange();

//  testRepeat();

//  testTimer();
}

void testCombineLatest() {
  var streamChar = Rx.timer(2, Duration(seconds: 2));
  var stream1 = Stream.periodic(Duration(seconds: 1), (count) => count);
  var stream2 = Stream.periodic(Duration(seconds: 3), (count) => count);

  Rx.combineLatest<int, String>([streamChar, stream1, stream2],
          (list) => "${list[0]}_${list[1]}_${list[2]}")
      .listen((data) => print("data: $data"));
}

void testCombineLatestList() {
  var streamChar = Rx.timer<int>(2, Duration(seconds: 2));
  var stream1 = Stream<int>.periodic(Duration(seconds: 1), (count) => count);
  var stream2 = Stream<int>.periodic(Duration(seconds: 3), (count) => count);

  Rx.combineLatestList<int>([streamChar, stream1, stream2])
      .listen((data) => print("data: $data"));
}

void textConcat() {
  var stream1 = Rx.timer(2, Duration(seconds: 2));
  var stream2 = Rx.timer(1, Duration(seconds: 1));
  var stream3 = Rx.timer(3, Duration(seconds: 3));
  var stream4 = Rx.timer(4, Duration(seconds: 1));

  Rx.concat<int>([stream1, stream2, stream3, stream4])
      .listen((data) => print("data: $data"));
}

void testConcatEager() {
  var stream1 = Rx.timer(2, Duration(seconds: 2));
  var stream2 = Rx.timer(1, Duration(seconds: 1));
  var stream3 = Rx.timer(3, Duration(seconds: 5));
  var stream4 = Rx.timer(4, Duration(seconds: 1));

  Rx.concatEager<int>([stream1, stream2, stream3, stream4])
      .listen((data) => print("data: $data"));
}

void testDefer() async {
  var time = new DateTime.now();
  print("${time.minute} : ${time.second}");

  Stream streamDeffer = Rx.defer<int>(() {
    var time = new DateTime.now();
    print("${time.minute} : ${time.second}");
    return Rx.range(0, 3);
  });
  await Future.delayed(Duration(seconds: 3));
  streamDeffer.listen((data) => print("data: $data"));
}

void testForkJoin() async {
  Rx.forkJoin([
    Stream.value('a'),
    Stream.fromIterable(['b', 'c', 'd'])
  ], (list) => list.join(', '))
      .listen((ele) => print("forkJoin : $ele")); // forkJoin : a, d

  Rx.forkJoin3(Stream.value('a'), Stream.value('b'),
          Stream.fromIterable(['c', 'd']), (a, b, c) => a + b + c)
      .listen((ele) => print("forkJoin3 : $ele")); // forkJoin3 : abd
}

void testMerge() async {
  Rx.merge([Rx.timer(1, Duration(seconds: 3)), Stream.value(2)])
      .listen((ele) => print("merge: $ele"));
  // print
  // merge: 2
  // merge: 1
}

void testRace() async {
  Rx.race([
    Rx.timer(2, Duration(seconds: 2)),
    Rx.timer(3, Duration(seconds: 3)),
    Rx.range(0, 3)
  ]).listen((ele) => print("race: $ele"));

  // print
  // race: 0
  // race: 1
  // race: 2
  // race: 3
}

void testRange() {
  Rx.range(0, 4).listen((data) => print("data: $data"));
}

void testRepeat() {
  Rx.repeat<int>((repeatIndex) => Rx.range(0, repeatIndex), 3)
      .listen((data) => print("data: $data"));
}

void testTimer() {
  Rx.timer<int>(2, Duration(seconds: 3)).listen((data) => print("data: $data"));
}
