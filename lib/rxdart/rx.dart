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

//  testDistinctUnique();

//  testExhaustMap();

//  testFlatMap();

//  testFlatMapIterable();

//  testGroupBy();

//  testInterval();

//  testMapTo();

//  testMaterialize();

//  testMax();

//  testMergeWith();

//  testMin();

//  testOnErrorResume();

//  testOnErrorResumeNext();

//  tesErrorReturn();

//  testOnErrorReturnWith();

//  testPairwise();

//  testSample();

//  testSampleTime();

//  testScan();

//  testSkipUtil();

//  testStartWith();

//  testStartWithMany();

//  testSwitchIfEmpty();

//  testSwitchMap();

//  testTakeUntil();

//  testThrottle();

//  testThrottleTime();

//  testTimeInterval();

//  testTimestamp();

//  testWhereType();

//  testWindow();

//  testWindowCount();

//  testWindowTest();

//  testWindowTime();

//  testWithLatestFrom();

//  testWithLatestList();

  testZipWith();
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
  Stream.fromIterable([1]).doOnEach(print).listen(null);
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

void testExhaustMap() {
  RangeStream(0, 2)
      .interval(Duration(milliseconds: 200))
      .exhaustMap((i) => TimerStream(i, Duration(milliseconds: 300)))
      .listen(print); // prints 0, 2
}

void testFlatMap() {
  RangeStream(1, 4)
      .flatMap((i) => TimerStream(i, Duration(seconds: i)))
      .listen(print); // prints 1, 2, 3, 4
}

void testFlatMapIterable() {
  RangeStream(1, 4)
      .map((ele) => List.filled(ele, ele))
      .flatMapIterable((ele) => Stream.value(ele))
      .listen(print); // prints 1, 2, 2, 3, 3, 3, 4, 4, 4, 4
}

void testGroupBy() {
  Stream.fromIterable([
    Per("A1", 19),
    Per("A2", 20),
    Per("B1", 19),
    Per("B2", 19),
    Per("C1", 21),
  ])
      .groupBy((ele) => ele.age)
      .flatMap((ele) => Rx.combineLatest2(
              Stream.value(ele.key), Stream.fromFuture(ele.toList()),
              (key, list) {
            return PerGroup(key, list);
          }))
      .listen(print);
  // log
  // PerGroup{age: 19, list: [Per{age: 19, name: A1}, Per{age: 19, name: B1}, Per{age: 19, name: B2}]}
  // PerGroup{age: 20, list: [Per{age: 20, name: A2}]}
  // PerGroup{age: 21, list: [Per{age: 21, name: C1}]}
}

class Per {
  String name;
  int age;

  Per(this.name, this.age);

  @override
  String toString() {
    return 'Per{age: $age, name: $name}';
  }
}

class PerGroup {
  int age;
  List<Per> list;

  PerGroup(this.age, this.list);

  @override
  String toString() {
    return 'PerGroup{age: $age, list: $list}';
  }
}

void testInterval() {
  print("min:${DateTime.now().minute}, second: ${DateTime.now().second}");
  Stream.fromIterable([
    1,
    2,
    3
  ]).interval(Duration(seconds: 1)).listen((i) => print(
      '$i sec, min:${DateTime.now().minute}, second: ${DateTime.now().second}'));
  // log
  // min:55, second: 57
  // 1 sec, min:55, second: 58
  // 2 sec, min:55, second: 59
  // 3 sec, min:56, second: 0
}

void testMapTo() {
  Stream.fromIterable([1, 2, 3, 4])
      .mapTo("AAA")
      .listen(print); // prints AAA, AAA, AAA, AAA
}

void testMaterialize() {
  Stream<int>.error(Exception()).materialize().listen((i) => print(i));
  // log
  // Notification{kind: Kind.OnError, value: null, error: Exception, stackTrace: null}
  // Notification{kind: Kind.OnDone, value: null, error: null, stackTrace: null}

  Stream.fromIterable([1, 2]).materialize().listen((i) => print(i));
  // log
  // Notification{kind: Kind.OnData, value: 1, error: null, stackTrace: null}
  // Notification{kind: Kind.OnData, value: 2, error: null, stackTrace: null}
  // Notification{kind: Kind.OnDone, value: null, error: null, stackTrace: null}
}

void testMax() async {
  final max = await Stream.fromIterable([1, 2, 3]).max();

  print(max); // prints 3

  final stream = Stream.fromIterable(['short', 'looooooong']);
  final max1 = await stream.max((a, b) => a.length - b.length);

  print(max1); // prints 'looooooong'
}

void testMergeWith() {
  TimerStream(1, Duration(seconds: 3)).mergeWith([
    Stream.fromIterable([2]),
    TimerStream(-1, Duration(seconds: 2))
  ]).listen(print); // prints 2, -1, 1
}

void testMin() async {
  final min = await Stream.fromIterable([1, 2, 3]).min();

  print(min); // prints 1

  final stream = Stream.fromIterable(['short', 'looooooong']);
  final min1 = await stream.min((a, b) => a.length - b.length);

  print(min1); // prints 'short'
}

void testOnErrorResume() {
  Stream.error(Exception())
      .onErrorResume(
          (dynamic e) => Stream.fromIterable([e is StateError ? 1 : 0]))
      .listen(print); // prints 0
}

void testOnErrorResumeNext() {
  Stream.error(Exception())
      .onErrorResumeNext(Stream.value(0))
      .listen(print); // prints 0
}

void tesErrorReturn() {
  Stream.error(Exception()).onErrorReturn(0).listen(print); // prints 0
}

void testOnErrorReturnWith() {
  Stream.error(Exception())
      .onErrorReturnWith((e) => e is Exception ? 1 : 0)
      .listen(print); // prints 1
}

void testPairwise() {
  RangeStream(1, 4).pairwise().listen(print); // prints [1, 2], [2, 3], [3, 4]
}

void testSample() {
  Stream.periodic(Duration(milliseconds: 300), (i) => i)
      .sample(Rx.repeat((i) => TimerStream(i, Duration(seconds: 1)), 3))
      .listen(print); // prints 3, 6, 10
}

void testSampleTime() {
  Stream.periodic(Duration(milliseconds: 300), (i) => i)
      .sampleTime(Duration(seconds: 1))
      .listen(print); // prints 3, 6, 10, ...
}

void testScan() {
  Stream.fromIterable([1, 2, 3])
      .scan((acc, curr, i) => acc + curr, 0)
      .listen(print); // prints 1, 3, 6
}

void testSkipUtil() {
  MergeStream([
    Stream.fromIterable([1]),
    TimerStream(2, Duration(seconds: 2))
  ])
      .skipUntil(TimerStream(true, Duration(seconds: 1)))
      .listen(print); // prints 2;
}

void testStartWith() {
  Stream.fromIterable([2]).startWith(1).listen(print); // prints 1, 2
}

void testStartWithMany() {
  Stream.fromIterable([3])
      .startWithMany([1, 2]).listen(print); // prints 1, 2, 3
}

void testSwitchIfEmpty() {
  Stream<String> memory = Stream.empty();
  Stream<String> disk = Stream.empty();
  Stream<String> network =
      TimerStream("I'm from network", Duration(seconds: 1));

  memory
      .switchIfEmpty(disk)
      .switchIfEmpty(network)
      .listen(print); // I'm from network
}

void testSwitchMap() {
  RangeStream(4, 1)
      .switchMap((i) => TimerStream(i, Duration(seconds: i)))
      .switchMap((i) => Stream.value("A-$i"))
      .listen(print); // prints A-1
}

void testTakeUntil() {
  MergeStream([
    Stream.fromIterable([1]),
    TimerStream(2, Duration(seconds: 2))
  ]).takeUntil(TimerStream(3, Duration(seconds: 1))).listen(print); // prints 1
}

void testThrottle() {
  Stream.periodic(Duration(seconds: 1), (i) => i)
      .throttle((_) => TimerStream(true, Duration(seconds: 2)))
      .listen(print); // prints 0, 3, 6, ...
}

void testThrottleTime() {
  Stream.periodic(Duration(seconds: 1), (i) => i)
      .throttleTime(Duration(seconds: 1, milliseconds: 500))
      .listen(print); //  prints 0, 2, 4, ...
}

void testTimeInterval() {
  Stream.fromIterable([1, 2])
      .interval(Duration(seconds: 2))
      .timeInterval()
      .listen((ele) =>
          print("value: ${ele.value}, time: ${ele.interval.inSeconds} s"));
  // log:
  // value: 1, time: 2 s
  // value: 2, time: 2 s
}

void testTimestamp() {
  Stream.fromIterable([1]).timestamp().listen((i) => print(
      i)); // prints 'TimeStamp{timestamp: 2020-05-17 16:12:21.042709, value: 1}';
}

void testWhereType() {
  Stream.fromIterable([1, 'two', 3, 'four'])
      .whereType<int>()
      .listen(print); // prints 1, 3
}

void testWindow() {
  Stream.periodic(Duration(milliseconds: 100), (i) => i)
      .window(Stream.periodic(Duration(milliseconds: 160), (i) => i))
      .asyncMap((stream) => stream.toList())
      .listen(print); // prints [0, 1] [2, 3] [4], [5],[6, 7] ...
}

void testWindowCount() {
  RangeStream(1, 4)
      .windowCount(2)
      .asyncMap((stream) => stream.toList())
      .listen(print); // prints [1, 2], [3, 4] done!
}

void testWindowTest() {
  Stream.periodic(Duration(milliseconds: 100), (int i) => i)
      .windowTest((i) => i % 3 == 0)
      .asyncMap((stream) => stream.toList())
      .listen(print); // prints [0], [1, 2, 3] [4, 5, 6] ...
}

void testWindowTime() {
  Stream.periodic(Duration(milliseconds: 100), (int i) => i)
      .windowTime(Duration(milliseconds: 220))
      .doOnData((_) => print('next window'))
      .flatMap((s) => s)
      .listen(print); // prints next window 0, 1, 2, next window 3, 4, ...
}


void testWithLatestFrom() {
  Stream.periodic(Duration(seconds: 1), (i) => i)
      .withLatestFrom(
      Stream.periodic(Duration(seconds: 2), (i) => i), (a, b) => a + b)
      .listen(print);

  // prints 2,3,5,6,8,...
}

void testWithLatestList() {
  Stream.fromIterable([1, 2]).withLatestFromList(
    [
      Stream.fromIterable([2, 3]),
      Stream.fromIterable([3, 4]),
      Stream.fromIterable([4, 5]),
      Stream.fromIterable([5, 6]),
      Stream.fromIterable([6, 7]),
    ],
  ).listen(
      print); // print [2, 2, 3, 4, 5, 6] (由于Stream的异步性质)
}

void testZipWith() {
  Stream.fromIterable([1])
      .zipWith(Stream.fromIterable([2]), (one, two) => "$one - $two")
      .listen(print); // prints 1 - 2
}