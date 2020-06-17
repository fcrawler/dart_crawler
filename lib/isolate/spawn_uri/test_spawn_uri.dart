import 'dart:io';
import 'dart:isolate';

void main() {
  print("main isolate start");

  create_isolate();

  // windows- path: '.\other_task.dart'
  print("path: '.${Platform.pathSeparator}other_task.dart'");

  print("main isolate stop");
}

// 创建一个新的 isolate
create_isolate() async {
  ReceivePort rp = new ReceivePort();
  SendPort port1 = rp.sendPort;

  Isolate newIsolate;

  if (Platform.isWindows) {
    // wiondows
    newIsolate = await Isolate.spawnUri(
        Uri.file(".${Platform.pathSeparator}other_task.dart"),
        ["hello, isolate", "this is args"],
        port1);
  } else {
    String path =
        "${Directory.current.path}/lib/isolate/spawn_uri/other_task.dart";
    print("create_isolate path: $path");

    newIsolate = await Isolate.spawnUri(Uri.file(path, windows: false),
        ["hello, isolate", "this is args"], port1);
  }

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
