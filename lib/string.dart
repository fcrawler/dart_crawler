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
  
  // 字符串连接

  String str1 = "abcdefg";
  String str2 = '12345';
  //使用+号连接
  String str3 = str1 + str2;
  //  使用相邻空格符号连接，必须是两个字符串  不能是变量
  String str4 = 'aaa' 'bbb';
  print(str3); // 'abcdefg12345'
  print(str4); // 'aaabbb'
  
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
        "pattern: ${m.group(0)}, start: ${m.start}, end: ${m.end}, input: ${m
        .input}, groupCount: ${m.groupCount}";
    print("matchAll - match: $match");
  }
  
  print("---------");
  
  for (Match m_ in matchAll_) {
    String match =
        "pattern: ${m_.group(0)}, start: ${m_.start}, end: ${m_
        .end}, input: ${m_.input}, groupCount: ${m_.groupCount}";
    print("matchAll_ - match: $match");
  }
  
  print("---------");
  
  for (Match m_ in expAll) {
    String match =
        "pattern: ${m_.group(0)}, start: ${m_.start}, end: ${m_
        .end}, input: ${m_.input}, groupCount: ${m_.groupCount}";
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
  // 判断是否包含某个字符串
  var strContains = 'teaphy';
  var contT = strContains.contains('t'); // true
  var contT_ = strContains.contains('t', 2); // false
  var contZ = strContains.contains('z'); // false
  var contRegExp = strContains.contains(RegExp(r'[a-z]')); // true
  print("contT: $contT");
  print("contT_: $contT_");
  print("contZ: $contZ");
  print("contRegExp: $contRegExp");
  
  // 判断是否以指定字符串开始或结束
  var strWith = 'teaphy';
  var endsWithY = strWith.endsWith('hy'); // true
  var endsWithT = strWith.endsWith('ht'); // false
  var startsWithTea = strWith.startsWith("tea"); // true
  var startsWithTea_ = strWith.startsWith("tea", 2); // false
  
  print("endsWithY: $endsWithY");
  print("endsWithT: $endsWithT");
  print("startsWithTea: $startsWithTea");
  print("startsWithTea_: $startsWithTea_");
  
  // 获取匹配指定Pattern的索引
  var strIndex = 'teapheay';
  var indexOfEa = strIndex.indexOf("ea"); // 1
  // 如果字符串中没有匹配到Pattern，返回-1
  var indexOfAa = strIndex.indexOf("eaa"); // -1
  var indexOfEa_ = strIndex.indexOf("ea", 2); // 5
  var lastIndexOfEa = strIndex.lastIndexOf("ea"); //  5
  var lastIndexOfEa_ = strIndex.lastIndexOf("ea", 2); //  1
  
  print("indexOfEa: $indexOfEa");
  print("indexOfAa: $indexOfAa");
  print("indexOfEa_: $indexOfEa_");
  print("lastIndexOfEa: $lastIndexOfEa");
  print("lastIndexOfEa_: $lastIndexOfEa_");
  
  // 判断是否为指定字符串的前缀
  String strPre = "tea";
  String targetPre = "teaphy";
  // 如果是指定字符串的前缀，返回Match;否则，返回null。
  // pattern: tea, start: 0, end: 3, input: teaphy, groupCount: 0
  var matchAsPrefixTea = strPre.matchAsPrefix("teaphy");
  // null
  var matchAsPrefixTea_ = strPre.matchAsPrefix("teaphy", 2);
  
  if (null == matchAsPrefixTea) {
    print("$strPre is not the prefix of $targetPre");
  } else {
    String strMatch =
        "pattern: ${matchAsPrefixTea.group(0)}, start: ${matchAsPrefixTea
        .start}, end: ${matchAsPrefixTea.end}, input: ${matchAsPrefixTea
        .input}, groupCount: ${matchAsPrefixTea.groupCount}";
    print("strMatch: $strMatch");
  }
  
  if (null == matchAsPrefixTea_) {
    print("$strPre is not the prefix of $targetPre offest 2");
  } else {
    String strMatch =
        "pattern: ${matchAsPrefixTea_.group(0)}, start: ${matchAsPrefixTea_
        .start}, end: ${matchAsPrefixTea_.end}, input: ${matchAsPrefixTea_
        .input}, groupCount: ${matchAsPrefixTea_.groupCount}";
    print("strMatch: $strMatch");
  }
  
  // 填充指定宽度的字符串
  var padResource = "teaphy"; // length: 6
  
  // "teaphy"的长度为6，指定宽度为10，字符串的长度小于指定宽度。
  // 此时，对于长度小于宽度的每个位置，使用指定的padding进行填充。
  // 如果没有指定padding，默认使用空格进行填充。
  var padLeft1 = padResource.padLeft(10); // '    teaphy'
  //  "teaphy"的长度为6，小于指定长度10，在其左边添加4个空格，并返回新的字符串
  var padLeft2 = padResource.padLeft(10, "123"); // '123123123123teaphy'
  // 当指定宽度小于或等于字符串的长度时，则不做任何填充。
  var padLeft3 = padResource.padLeft(6); // 'teaphy'
  var padLeft4 = padResource.padLeft(5); // 'teaphy'
  
  // "teaphy"的长度为6，小于指定长度10，在其右边添加4个空格，并返回新的字符串
  var padRight = padResource.padRight(10); // 'teaphy    '
  
  print("padLeft1: \'$padLeft1\'");
  print("padLeft2: \'$padLeft2\'");
  print("padLeft3: \'$padLeft3\'");
  print("padLeft4: \'$padLeft4\'");
  print("padRight: \'$padRight\'");
  
  // 替换字符串
  var replaceRes = "teaphy teaphy";
  var replaceAll = replaceRes.replaceAll("tea", "zzzz"); // 'zzzzphy zzzzphy'
  var replaceFirst = replaceRes.replaceFirst("tea", "zzzz"); // 'zzzzphy teaphy'
  var replaceRange =
  replaceRes.replaceRange(1, 3, "zzzzbbbb"); // 'tzzzzbbbbphy teaphy'
  
  var replaceAllMapped = replaceRes.replaceAllMapped("tea", (match) {
    return match.start > 3 ? "aaaa" : "bbbb";
  }); // 'bbbbphy aaaaphy'
  
  var replaceFirstMapped = replaceRes.replaceFirstMapped("tea", (match) {
    return match.start > 3 ? "aaaa" : "bbbb";
  }); // 'bbbbphy teaphy'
  
  print("replaceAll: \'$replaceAll\'");
  print("replaceFirst: \'$replaceFirst\'");
  print("replaceRange: \'$replaceRange\'");
  print("replaceAllMapped: \'$replaceAllMapped\'");
  print("replaceFirstMapped: \'$replaceFirstMapped\'");
  
  // 切割字符串
  var splitRes = "1-22-3-4-5-6-7-8-9";
  // 查找此字符串中所有Patter的匹配项，并返回匹配项之间的子字符串列表。
  var split = splitRes.split("-"); // '[1, 22, 3, 4, 5, 6, 7, 8, 9]'
  
  // 字符串开头和结尾的空匹配将被忽略，另一个匹配之后的空匹配也将被忽略。
  var splitRegExp = "a1bbcca";
  var split2 = splitRegExp.split(RegExp(r"b*")); // '[a, 1, c, c, a]'
  
  var splitEmpty = '';
  // 如果字符串为空，则如果`pattern`为空字符串，则返回空列表，
  // 如果Patter为非空，即不匹配，则为[""]。
  var splitEmpty1 = splitEmpty.split(""); // '[]'
  var splitEmpty2 = splitEmpty.split("aaa"); // '[""]'
  
  // 使用Pattern为"",将字符串拆分为单个代码单位字符串列表。
  var patternEmptyRes = "abcde";
  var patternEmpty = patternEmptyRes.split(""); // '[a, b, c, d, e]'
  
  print("split: \'$split\'");
  print("split2: \'$split2\'");
  print("splitEmpty1: \'$splitEmpty1\'");
  print("splitEmpty2: \'$splitEmpty2\'");
  print("patternEmpty: \'$patternEmpty\'");
  
  var splitMapJoinRes = "Hello world!!!";
  // 根据pattern拆分字符串，并将各部分按照指定规则转换，然后将它们组合为新的字符串。
  // 1. pattern用于将字符串分成多个部分并分隔匹配项。
  // 2. onMatch方法用于指定每个匹配项即将转换的字符串。如果没有指定onMatch，则使用匹配的字符串。
  // 3. 为onNonMatch方法用于指定每个不匹配的部分即将转换的字符串。如果没有指定onNonMatch，则使用不匹配的字符串。
  var splitMapJoin = splitMapJoinRes.splitMapJoin("world",
      onMatch: (m) => m.group(0),
      onNonMatch: (m) => "*"); // 'Hello world!!!'
  var splitMapJoin1 = splitMapJoinRes.splitMapJoin("world",
      onMatch: (m) => m.group(0)); // '*world*'
  var splitMapJoin2 = splitMapJoinRes.splitMapJoin("world",
      onNonMatch: (m) => "*"); // '*world*'
  print("splitMapJoin: \'$splitMapJoin\'");
  print("splitMapJoin1: \'$splitMapJoin1\'");
  print("splitMapJoin2: \'$splitMapJoin2\'");
  
  var substringRes = "abcdefgh";
  // 如果只指定startIndex,不指定endIndex，将从索引startIndex开始截取，直到字符串末尾
  var substring1 = substringRes.substring(1);  // 'bcdefgh'
  // 如果同时指定startIndex和endIndex，将从索引startIndex开始截取，直到endIndex，但是不包括索引endIndex所对应的字符
  var substring2 =  substringRes.substring(1, 4); // 'bcd'
  
  print("substring1: \'$substring1\'");
  print("substring2: \'$substring2\'");
}
