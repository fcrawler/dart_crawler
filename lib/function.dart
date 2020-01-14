void main() {
  // 调用say，但是没有提供可选位置参数:
  say('Bob', 'Howdy');

  // 调用say，并提供部分可选位置参数:
  say('Bob', 'Howdy', '8swese72');

  // 调用say，并提供全部可选位置参数:
  say('Bob', 'Howdy', '8swese72', 'dev_se72');

  // 命名参数
  // bold.runtimeType: int, hidden.runtimeType: String
  enableFlags(bold: 222);
  // bold.runtimeType: String, hidden.runtimeType: int
  enableFlags(bold: "AAA", hidden: 222);

  handleError("error", ifMissing: () => print("do if missing"));

  print(returnNull());

  // 闭包
  [1, 2, 3].forEach((ele) => print("ele: $ele"));

  // 级联
  "hello".length.toString(); // 值为5
  "hello"..length.toString(); // 值为"hello"

  // 级联还有一种使用场景就是当执行某个对象的方法时，
  // 需要的返回值是对象本身，但方法返回的却是其他值。
//	var sort = [2, 1, 3].sort();
  var sort = [2, 1, 3]..sort();

  print("sort: $sort");

  // Function
  Function.apply(
      say, ["qingdao", "hello", "8swese72"]);
  
  Function.apply(enableFlags, [], const {#bold: "1", Symbol("hidden"): "2"});
}

/**
 * 声明函数say，其有两个必须位置参数from、msg，有两个可选位置参数device、deviceName
 */
String say(String from, String msg, [String device, String deviceName]) {
  var result = '$from says $msg';
  print("say result: $result");

  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

/**
 * 可选参数可以指定默认值，但必须是编译时常量。
 */
void doScan(String filePath,
    [String device = "",
    int size = 20,
    List<int> position = const [1, 2, 3],
    Map<String, String> config = const {}]) {
  print("do scan");
}

/**
 * 声明函数enableFlags，其有两个命名参数 - bold、hidden。
 */
void enableFlags({bold, hidden}) {
  print(
      "bold.runtimeType: ${bold.runtimeType}, hidden.runtimeType: ${hidden.runtimeType}");
}

/**
 * 通常，作为错误处理程序的回调函数会通过命名参数来指定，其
 * 他形式参数则通过位置参数给出。
 */
void handleError(String msg, {void ifMissing()}) {
  print("msg: $msg");

  if (null != ifMissing) {
    ifMissing();
  }
}

returnNull() {
  print("excute returnNull");
}
