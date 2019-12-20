import 'person.dart';

void main() {
  // 1. 声明单行字符串
  // 1.1 使用单引号创建字符串
  var singleQuotes = 'Single quotes';
  // 1.2 使用双引号创建字符串
  var doubleQuotes = "Double quotes";
  // 1.3 在单引号创建字符串中，使用双引号强调某个值
  var doubleQuotesInSingleQuote = 'Double quotes in "single" quotes';
  // 1.4 在双引号创建字符串中，使用单引号强调某个值
  var singleQuotesInDouble = "Single quotes in 'double' quotes";

  // 2. 声明多行字符串

  var singleMultiline = '''
	A
	multiline
	string
	''';

  var doubleMultiline = """
	A
	multiline
	string
	""";

  print("singleQuotes: $singleQuotes");
  print("doubleQuotes: $doubleQuotes");
  print("doubleQuotesInSingleQuote: $doubleQuotesInSingleQuote");
  print("singleQuotesInDouble: $singleQuotesInDouble");
  print("singleMultiline : \n $singleMultiline");
  print("doubleMultiline : \n $doubleMultiline");

  // 3. 字符串插值
  var person = Person(20, "Job");
  var aa = "aa";
  var bb = "$aa, ${5 + 6}, $person"; // bb: aa, 11, Person{age: 20, name: Job}
  print("bb: $bb");

  var s1 = 'Hello '
      'world'
      '!'; // Hello world!
  var s2 = 'Hello world, ' + 'I\'m Job.'; //Hello world, I'm Job.
  print("s1: $s1");
  print("s2: $s2");

  var rawstr =
      r'In a raw string, not even \n gets special treatment.'; // In a raw string, not even \n gets special treatment.
  var nRawStr = 'In a string, \n gets special treatment.'; // In a string,
  // gets special treatment.
  print("rawstr: $rawstr");
  print("nRawStr: $nRawStr");

  // 4. 字符串字面量是编译时常量时,可用类型有num、String、null或bool。
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // 字符串字面量是编译时常量时,不可用类型
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString =
      '$aConstNum $aConstBool $aConstString'; // validConstString: 0 true a constant string
  //  const validConstString = '$aConstNum $aConstBool $aConstString $aConstList';
  print("validConstString: $validConstString");

  // 5. 字符串是UTF-16编码单元的不可变序列。
  String tStr = "teaphy";
  var tCodeUnit = tStr.codeUnitAt(0); // 116
  var listCodeUnit = tStr.codeUnits; // [116, 101, 97, 112, 104, 121]
  var descCodeUnit = tStr[0]; // t
  var tRunes = tStr.runes; // (116, 101, 97, 112, 104, 121)

  print("tCodeUnit: $tCodeUnit");
  print("listCodeUnit: $listCodeUnit");
  print("descCodeUnit: $descCodeUnit");
  print("tRunes: $tRunes");

  var muiStr = "t\u{1D11E}";
  var muiCodeUnit = muiStr.codeUnits; // [0x0074, 0xd834, 0xdd1e]
  var muiRunes = muiStr.runes; // [[0x0074, 0x1d11e]

  for (var codeUnit in muiCodeUnit) {
    print("codeUnit: ${codeUnit.toRadixString(16)}");
  }

  for (var rune in muiRunes.toList()) {
    print("rune: ${rune.toRadixString(16)}");
  }

  print("muiCodeUnit: $muiCodeUnit");
  print("muiRunes: $muiRunes");

  // 6. 常用属性
  var strProperty = "teaphy";
  var strEmpty = "";

  // 6.1 length表示字符串的长度
  // 非空字符串的长度为字符串中字符的个数
  var length = strProperty.length;
  // 空字符串的长度为0
  var lengthEmpty = strEmpty.length;
  // 6.2 empty表示字符串是否为空
  // 6.2.1 当字符串不为空时，isEmpty的值为false
  var isEmptyT = strProperty.isEmpty; // isEmptyT: false
  // 6.2.1 当字符串为空时，isEmpty的值为true
  var isEmptyY = strEmpty.isEmpty;

  // 6.3 isNotEmpty表示字符串是否不为空
  // 6.3.1 当字符串不为空时，isNotEmpty的值为true
  var isNotEmptyT = strProperty.isNotEmpty; // isNotEmptyT: true
  // 6.3.1 当字符串为空时，isNotEmpty的值为false
  var isNotEmptyY = strEmpty.isNotEmpty; // isNotEmptyY: false

  print("length: $length"); // length: 6
  print("lengthEmpty: $lengthEmpty"); // length: 0
  print("isEmptyT: $isEmptyT"); // isEmptyT: false
  print("isEmptyY: $isEmptyY"); // isEmptyY: true
  print("isNotEmptyT: $isNotEmptyT"); // isNotEmptyT: true
  print("isNotEmptyY: $isNotEmptyY"); // isNotEmptyY: false

  // Operate
  String strOperate = "123";
  String strOperate_ = "123";
  String strOperateB = "bbb";

  // 用来将此字符串与自身连接N次来创建新字符串，也就是说新的字符串为原字符串重复N次的结果
  // str * n = str + str + ...(n次)... + str.
  String opeMul = strOperate * 3; // peMul: 123123123
  // 用来将此字符串与其他字符串（other）连接来创建新字符串。
  String opePlus = strOperate + strOperateB; // opePlus: 123bbb
  // 用来判断两个字符串是否相等,如果other与当前字符串有相同的unit code序列，则返回true。
  var oprEqu = strOperate == strOperateB; //oprEqu: false
  var oprEqu_ = strOperate == strOperate_; // oprEqu_: true
	// 用来获取指定位置的字符
  String oprFirst = strOperate[0]; // oprFirst: 1

  print("opeMul: $opeMul");
  print("opePlus: $opePlus");
  print("oprEqu: $oprEqu");
  print("oprEqu_: $oprEqu_");
  print("oprFirst: $oprFirst");
}
