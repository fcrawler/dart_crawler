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

  // Operate
  String operRes = "aaa";
  String opeResMul = operRes * 3;

  print("opeResMul: $opeResMul");

  // 大小写转换
  var letterCase = "Teaphy";

  var lowerCase = letterCase.toLowerCase(); // lowerCase: teaphy
  var upperCase = letterCase.toUpperCase(); // upperCase: TEAPHY
  print("lowerCase: $lowerCase");
  print("upperCase: $upperCase");

  // match
  var matchRes = "Hello world！Hello world！Hello world！Hello world！";

  RegExp exp = RegExp(r"(He|ld)");

  var matchAll = "Hello".allMatches(matchRes);
  var matchAll_ = "Hello".allMatches(matchRes, 3);
  var expAll = exp.allMatches(matchRes);

  for (Match m in matchAll) {
    String match =
        "pattern: ${m.group(0)}, start: ${m.start}, end: ${m.end}, input: ${m.input}, groupCount: ${m.groupCount}";
    print("matchAll - match: $match");
  }

  print("---------");

  for (Match m_ in matchAll_) {
    String match =
        "pattern: ${m_.group(0)}, start: ${m_.start}, end: ${m_.end}, input: ${m_.input}, groupCount: ${m_.groupCount}";
    print("matchAll_ - match: $match");
  }

  print("---------");

  for (Match m_ in expAll) {
    String match =
        "pattern: ${m_.group(0)}, start: ${m_.start}, end: ${m_.end}, input: ${m_.input}, groupCount: ${m_.groupCount}";
    print("expAll $match");
  }

  // 去除空字符串

  var trimResource = "       aaaa  bbbb     ";
  // 去除字符串的左右两端的空字符串
  var strTrim = trimResource.trim(); // "aaaa  bbbb"
  // 去除字符串的左端的空字符串
  var trimLeft = trimResource.trimLeft(); // "aaaa  bbbb     "
  // 去除字符串的右端的空字符串
  var trimRight = trimResource.trimRight(); // "       aaaa  bbbb"

  print("strTrim：$strTrim");
  print("trimLeft：$trimLeft");
  print("trimRight：$trimRight");

  // 获取unit code
  var strUnitCode = "teaphy";
  // "teaphy"的第一个字符为't'，其unit code值为116
  var tUnitCode = strUnitCode.codeUnitAt(0); // 116
  print("tUnitCode: $tUnitCode");

  // 比较字符串先后顺序
  var a = "abcdef";
  var b = "abc";
  var aTob = a.compareTo(b); // 1
  var bToa = b.compareTo(a); // -1
  var aToa = a.compareTo(a); // 0


  print("aTob: $aTob");
  print("bToa: $bToa");
  print("aToa: $aToa");

}
