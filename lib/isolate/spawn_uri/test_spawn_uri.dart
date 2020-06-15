import 'dart:io';
import 'dart:isolate';

void main() {
  print("main isolate start");

  create_isolate();

//    File file = File("./other_task.dart");
//  print("relative path: ${file.path}");
//  print("absolute path: ${file.absolute}");
//
//  Uri aa = Uri.file("/other_task.dart", windows: false);
//  Uri bb = Uri.directory("lib", windows: false);
//
//  print("aa path: ${aa.path}");
//  print("bb path: ${bb.path}");

//  print("path: ${file.path}");

  print("main isolate stop");
}

// 创建一个新的 isolate
create_isolate() async {
  ReceivePort rp = new ReceivePort();
  SendPort port1 = rp.sendPort;

//  Isolate newIsolate = await Isolate.spawnUri(
//      File("./other_task.dart").uri,
//      ["hello, isolate", "this is args"],
//      port1);

  Isolate newIsolate = await Isolate.spawnUri(
      Uri.file("/Users/teaphy/test_code/dart_crawler/lib/isolate/spawn_uri/other_task.dart", windows: false),
      ["hello, isolate", "this is args"],
      port1);

  SendPort port2;
  rp.listen((message) {
    print("main isolate message: $message");
    if (message[0] == 0) {
      port2 = message[1];
    } else {
      port2?.send([1, "这条信息是 main isolate 发送的"]);
    }
  });
}
