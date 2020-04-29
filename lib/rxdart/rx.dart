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

//  testPushSubject();

//    testBehaviorSubject();

//    testReplaySubject();

//  testBuffer();

//  testBufferCount();

//  testBufferTest();

//  testBufferTimer();

//  testConcatWith();

//  testPush();

//  testPublishReplay();

//  testPublishValue();

//  testPublishValueSeeded();

//  testShare();

//  testShareReply();

//  testShareValue();

//  testShareValueSeeded();

//  testDebounce();

//  testDebounceTime();

//  testDefaultIfEmpty();

//  testDelay();

//  testDematerialize();

  testDistinctUnique();
}

// todo

void testDefaultIfEmpty() {
  Stream.empty().defaultIfEmpty(10).listen(print); // print: 10
}

void testDelay() {
  print("start；${DateTime.now()}");

  Stream.fromIterable([1, 2, 3, 4]).delay(Duration(seconds: 2)).listen((data) =>
      print(
          "data: $data, time: ${DateTime.now()}")); // 延迟2s后， prints 1, 2, 3, 4
}

void testDematerialize() {
  Stream<Notification<int>>.fromIterable(
          [Notification.onData(1), Notification.onDone()])
      .dematerialize()
      .listen((i) => print(i)); // Prints 1

  Stream<Notification<int>>.fromIterable(
          [Notification.onError(Exception(), null)])
      .dematerialize()
      .listen(null, onError: (e, s) {
    print(e);
  }); // Prints Exception
}

class Stu {
  int id;
  String name;
  int age;

  Stu(this.id, this.name, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stu &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'Stu{id: $id, name: $name, age: $age}';
  }
}

void testDistinctUnique() {
  Stream.fromIterable([
    Stu(1, "A", 19),
    Stu(2, "A", 20),
    Stu(3, "A", 21),
    Stu(4, "A", 19),
    Stu(5, "A", 20),
    Stu(6, "A", 21),
  ]).distinctUnique(equals: (e1, e2) {
    return e1.age == e2.age;
  }, hashCode: (e) {
    return e.age;
  }).listen(print);
}

void testDo() {
  // doCancel
  final subscription = TimerStream(1, Duration(minutes: 1))
      .doOnCancel(() => print('hi'))
      .listen(null);

  subscription.cancel(); // prints 'hi'

  // doOnData,doOnDone, doOnListen
  Stream.fromIterable([1, 2, 3])
      .doOnData(print) // prints 1, 2, 3
      .doOnDone(() => print('all set')) // prints all set
      .doOnListen(() => print('Is someone there?')) // print Is someone there?'
      .listen(null);
  // doOnEach
  Stream.fromIterable([1])
      .doOnEach(print)
      .listen(null);
  // prints
  // Notification{kind: OnData, value: 1, errorAndStackTrace: null},
  // Notification{kind: OnDone, value: null, errorAndStackTrace: null}

  // doOnError
  Stream.error(Exception())
      .doOnError((error, stacktrace) => print('oh no'))
      .listen(null); // prints 'Oh no'

  // doOnPause, doOnResume
  final subscription1 = Stream.fromIterable([1])
      .doOnPause((ele) => print('Gimme a minute please'))
      .doOnResume(() => print('Let\'s do this!'))
      .listen(null);
  subscription1.pause(); // prints 'Gimme a minute please'
  subscription1.resume(); // prints Let's do this!
 }

// todo

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
  final subject = PublishSubject<int>(onListen: () {
    // 在第一次订阅时，调用
    print("onListen");
  }, onCancel: () {
    // 在第一取消订阅时，调用
    print("onCancel");
  });

// observer1 will receive all data and done events
  var streamSubscription1 =
      subject.stream.listen((ele) => print("observer1: $ele")); //
  subject.add(1);
  subject.add(2);

// observer2 will only receive 3 and done event
  var streamSubscription2 =
      subject.stream.listen((ele) => print("observer2: $ele"));
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

  subject.stream
      .listen((ele) => print("observer1: $ele")); // prints 0,1,2,3,4,5

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

void testBuffer() async {
  print("now: ${DateTime.now()}");
  Stream.periodic(Duration(milliseconds: 100), (i) {
    print("i: $i, now: ${DateTime.now()}");
    return i;
  })
      .buffer(Stream.periodic(Duration(milliseconds: 160), (j) {
        print("j: $j, now: ${DateTime.now()}");
        return j;
      }))
      .listen(print); // prints [0, 1] [2, 3] [4, 5] ...
}

void testBufferCount() {
//  RangeStream(1, 7)
//      .bufferCount(2)
//      .listen(print); // prints [1, 2], [3, 4],[5, 6],[7]

  RangeStream(1, 7)
      .bufferCount(3, 2)
      .listen(print); // [1, 2, 3], [3, 4, 5],[5, 6, 7],[7]
}

void testBufferTest() {
  Stream.periodic(Duration(milliseconds: 100), (int i) => i)
      .bufferTest((i) => i % 3 == 0)
      .listen(print); // prints [0], [1, 2, 3] [4, 5, 6] ...
}

void testBufferTimer() {
  Stream.periodic(Duration(milliseconds: 100), (int i) => i)
      .bufferTime(Duration(milliseconds: 220))
      .listen(
          print); // prints [0, 1, 2] [3, 4] [5, 6] [7, 8][9, 10, 11][12, 13]...
}

void testConcatWith() {
  TimerStream(1, Duration(seconds: 2)).concatWith([
    Stream.fromIterable([2]),
    Rx.range(8, 10)
  ]).listen(print); // prints 1, 2, 8, 9, 10
}

void testPush() {
  final source = Stream.fromIterable([1, 2, 3]);
  final ConnectableStream<int> connectable = source.publish();

  // 即使已经订阅，但ConnectableStream不会从源Stream发出任何元素
  connectable.listen((data) => print("listen1: $data")); // print: 1,2,3

  connectable.listen((data) => print("listen2: $data")); // print: 1,2,3

  // 指示ConnectableStream开始从源Stream发射项目。
  final subscription = connectable.connect();

  // 停止从Stream流中发送项目并关闭Subject
  subscription.cancel();
}

void testPublishReplay() async {
  final source = Stream.fromIterable([1, 2, 3]);
  final ReplayConnectableStream connectable = source.publishReplay();

  // 即使已经订阅，但ConnectableStream不会从源Stream发出任何元素
  connectable.listen((data) => print("listen1: $data")); // print: 1,2,3

  // 指示ReplayConnectableStream开始从源Stream发射项目。
  final subscription = connectable.connect();

  await Future.delayed(Duration(seconds: 2));

  // 新的订阅者将收到发出的值，最大为指定的maxSize
  connectable.listen((data) => print("listen2: $data")); // print: 1,2,3

  // 对发射元素的同步访问
  print(connectable.values); // print: [1, 2, 3]

  // 停止从Stream流中发送项目并关闭ReplaySubject
//  subscription.cancel();
}

void testPublishValue() async {
  final source = Stream.fromIterable([1, 2, 3]);
  final ValueConnectableStream connectable = source.publishValue();

  // 即使已经订阅，但ValueConnectableStream不会从源Stream发出任何元素
  connectable.listen(print);

  // 指示ValueConnectableStream开始从源Stream发射元素。
  final subscription = connectable.connect();

  await Future.delayed(Duration(seconds: 1));

  // 新的监听器将接收到最新发出的值
  connectable.listen(print); // Prints 3

  // 新的订阅者将收到最新发出的值
  print(connectable.value); // Prints 3

  // 停止从Stream流中发送项目并关闭BehaviorSubject
//  subscription.cancel();
}

void testPublishValueSeeded() async {
  final source = Stream.fromIterable([1, 2, 3]);
  final ValueConnectableStream connectable = source.publishValueSeeded(0);

  // 即使已经订阅，但ValueConnectableStream不会从源Stream发出任何元素
  connectable.listen(print);

  // 指示ValueConnectableStream开始从源Stream发射元素。
  // 但是，ValueConnectableStream会先发射seedValue，再发射Stream中的元素。
  // 第一个订阅者将依次接收到 0, 1, 2, 3
  final subscription = connectable.connect();

  await Future.delayed(Duration(seconds: 1));

  // 新的监听器将接收到最新发出的值
  connectable.listen(print); // Prints 3

  // 新的订阅者将收到最新发出的值
  print(connectable.value); // Prints 3

  // 停止从Stream流中发送项目并关闭BehaviorSubject
//  subscription.cancel();
}

void testShare() {
  // 将通过fromIterable创建的单订阅Stream转为广播Stream
  final stream = Stream.fromIterable([1, 2, 3]).share();

  // 订阅新的Stream，并开始发射源Stream中的数据
  final subscription = stream.listen(print); // print 1,2,3

  // 取消订阅，并关闭PublishSubject
//  subscription.cancel();
}

void testShareReply() async {
  // 将单订阅从Iterable Stream转换为广播Stream，该广播Stream将向任何订阅者发出最新值
  final stream = Stream.fromIterable([1, 2, 3]).shareReplay(maxSize: 2);

  // 订阅新的ReplyStream，并开始发射源Stream中的数据
  final subscription = stream.listen(print); // print: 1, 2, 3

  await Future.delayed(Duration(seconds: 1));

  // 提供同步访问Stream中 maxSize个最新数据的能力。
  print(stream.values); // print [2, 3]

  await Future.delayed(Duration(seconds: 2));

  // 新的订阅者将接收到最新的maxSize个元素
  final subscription2 = stream.listen(print); // print: 2, 3

  // 取消订阅，并关闭ReplaySubject
//  subscription.cancel();
//  subscription2.cancel();
}

void testShareValue() async {
  // 将单订阅从Iterable Stream转换为广播ValueStream，该广播Stream将向任何订阅者发出最新值
  final stream = Stream.fromIterable([1, 2, 3]).shareValue();

  //  // 订阅新的ValueStream，并开始发射源Stream中的数据
  final subscription = stream.listen(print); // print: 1, 2, 3

  await Future.delayed(Duration(seconds: 1));

  //  // 提供同步访问Stream最新发射的数据的能力
  print(stream.value); // print: 3

  await Future.delayed(Duration(seconds: 2));

  // 新的订阅者将接收到最新的元素
  final subscription2 = stream.listen(print); // print: 3

  // 取消订阅，并关闭BehaviorSubject
//  subscription.cancel();
//  subscription2.cancel();
}

void testShareValueSeeded() async {
  // 将单订阅从Iterable Stream转换为广播ValueStream，该广播Stream将向任何订阅者发出最新值
  final stream = Stream.fromIterable([1, 2, 3])
      .delay(Duration(seconds: 1))
      .shareValueSeeded(0);

  //  // 订阅新的ValueStream，并开始发射源Stream中的数据
  final subscription = stream.listen(print); // print: 0, 1, 2, 3

  await Future.delayed(Duration(seconds: 2));

  //  // 提供同步访问Stream最新发射的数据的能力
  print(stream.value); // print: 3

  await Future.delayed(Duration(seconds: 2));

  // 新的订阅者将接收到最新的元素
  final subscription2 = stream.listen(print); // print: 3

  // 取消订阅，并关闭BehaviorSubject
//  subscription.cancel();
//  subscription2.cancel();
}

void testDebounce() {
  Stream.fromIterable([1, 2, 3, 4]).debounce((ele) {
    print(
        "debounce - ele: $ele, , time: ${DateTime.now()}"); // print: 1, 2, 3, 4
    return Rx.timer(-1, Duration(seconds: 2));
  }).listen((ele) =>
      print("listen - ele: $ele, time: ${DateTime.now()}")); // prints 4
}

void testDebounceTime() {
  Stream.fromIterable([1, 2, 3, 4])
      .debounceTime(Duration(seconds: 1))
      .listen(print); // prints 4
}
