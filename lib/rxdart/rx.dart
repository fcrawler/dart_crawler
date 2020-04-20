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

//  testRace();

//  testRange();

//  testRepeat();

//  testRetry();

//  testRetryWhen();

//  testSequenceEqual();

//  testSwitchLatest();

//  testTimer();

//  testZip();

//  testZipList();

  testPushSubject();

//    testBehaviorSubject();

//    testReplaySubject();
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

void testRetry() async {
  Rx.retry(() => Stream.value(1)).listen((i) => print(i));
  // log
  // 1

  Rx.retry(() => Stream.value(1).concatWith([Stream.error(Error())]), 1)
      .listen(print, onError: (e, s) => print(e));
  // log
  // 1
  // 1
  // Received an error after attempting 1 retries
}

void testRetryWhen() async {
  bool errorHappened = false;
  Rx.retryWhen(
    () => Stream.periodic(const Duration(seconds: 1), (i) => i).map((i) {
      if (i == 3 && !errorHappened) {
        throw 'We can take this. Please restart.';
      } else if (i == 4) {
        throw 'It\'s enough.';
      } else {
        return i;
      }
    }),
    (e, s) {
      errorHappened = true;
      if (e == 'We can take this. Please restart.') {
        return Stream.value('Ok. Here you go!');
      } else {
        return Stream.error(e);
      }
    },
  ).listen(
    print,
    onError: (e, s) => print(e),
  );
  // log
  // 0
  // 1
  // 2
  // 0
  // 1
  // 2
  // 3
  // Received an error after attempting to retry.
}

void testSequenceEqual() async {
  Rx.sequenceEqual(Stream.fromIterable([1, 2, 3, 4, 5]),
      Stream.fromIterable([1, 2, 3, 4, 5])).listen(print);
  // log
  // true
}

void testSwitchLatest() async {
  Rx.switchLatest(Stream.fromIterable(<Stream<String>>[
    Rx.timer('A', Duration(seconds: 2)),
    Rx.timer('B', Duration(seconds: 1)),
    Stream.value('C'),
  ])).listen(print);

  // Since the first two Streams do not emit data for 1-2 seconds, and the
  // 3rd Stream will be emitted before that time, only data from the 3rd
  // Stream will be emitted to the listener.
  // log
  // C
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

void testZip() async {
  Rx.zip([
    Stream.value('Hi '),
    Stream.fromIterable(['Friend', 'Dropped']),
  ], (values) => values.first + values.last).listen(print);
  // log
  // 'Hi Friend'
}

void testZipList() async {
  Rx.zipList(
    [
      Stream.value('Hi '),
      Stream.fromIterable(['Friend', 'Dropped']),
    ],
  ).listen(print);

  // log
  // ['Hi ', 'Friend']
}

void testPushSubject() {
  final subject = PublishSubject<int>(onListen: (){
    // 在第一次订阅时，调用
    print("onListen");
  }, onCancel: (){
    // 在第一取消订阅时，调用
    print("onCancel");
  });

// observer1 will receive all data and done events
  var streamSubscription1 = subject.stream.listen((ele) => print("observer1: $ele")); //
  subject.add(1);
  subject.add(2);

// observer2 will only receive 3 and done event
  var streamSubscription2 = subject.stream.listen((ele) => print("observer2: $ele"));
  subject.add(3);
  // 发送 Error
//  subject.addError(Exception("test error"));
  // test cancel
//  streamSubscription1.cancel();
//  streamSubscription2.cancel();
  subject.close();
  // print
  // onListen
  // observer1: 1
  // observer2: 3
  // observer1: 2
  // observer1: 3
  // onCancel
}


void testBehaviorSubject() {

  final subject = BehaviorSubject<int>();

  subject.stream.listen((ele) => print("observer1: $ele")); // prints 1,2,3,4,5

  subject.add(1);
  subject.add(2);
  subject.add(3);

  subject.stream.listen((ele) => print("observer2: $ele")); // prints 1,2,3,4,5

  subject.add(4);
  subject.add(5);

  subject.stream.listen((ele) => print("observer3: $ele")); // prints 1,2,3,4,5
  subject.close();
}



void testReplaySubject() {

  final subject = ReplaySubject<int>(maxSize: 2);

  subject.stream.listen((ele) => print("observer1: $ele")); // prints 0,1,2,3,4,5

  subject.add(0);
  subject.add(1);
  subject.add(2);
  subject.add(3);

  subject.stream.listen((ele) => print("observer2: $ele")); // prints 2,3, 4, 5

  subject.add(4);
  subject.add(5);

  subject.stream.listen((ele) => print("observer3: $ele")); // prints 4,5
  subject.close();
}