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

  var singleMultiline =
  '''
	A
	multiline
	string
	''';

  var doubleMultiline =
  """
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
	var bb = "$aa, ${5+6}, $person"; // bb: aa, 11, Person{age: 20, name: Job}
	print("bb: $bb");

  var s1 = 'Hello '
		  'world'
      '!'; // Hello world!
  var s2 = 'Hello world, ' + 'I\'m Job.'; //Hello world, I'm Job.
  print("s1: $s1");
  print("s2: $s2");
  
  var rawstr = r'In a raw string, not even \n gets special treatment.';// In a raw string, not even \n gets special treatment.
  var nRawStr = 'In a string, \n gets special treatment.'; // In a string,
                                                           // gets special treatment.
  print("rawstr: $rawstr");
  print("nRawStr: $nRawStr");
}
