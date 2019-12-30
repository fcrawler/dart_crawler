void main() {
  // 常用属性
  // 正无穷大
  var infinitePlus = double.infinity;
  // 负无穷大
  var infiniteMinus = -double.infinity;
  var nanRes = double.nan;
  // int
  var intPositive = 1;
  var intNegative = -1;
  // double
  var doublePositive = 2.0;
  var doubleNegative = -2.0;
  var zeroPositive = 0.0;
  var zeroNegative = -0.0;

  // isFinite 判断数字是不是有限数
  // 唯一的非有限数是NaN，正无穷大和负无穷大。
  print("infinitePlus.isFinite: ${infinitePlus.isFinite}"); // false
  print("infiniteMinus.isFinite: ${infiniteMinus.isFinite}"); // false
  print("nanRes.isFinite: ${nanRes.isFinite}"); // false
  print("intPositive.isFinite: ${intPositive.isFinite}"); // true
  print("intNegative.isFinite: ${intNegative.isFinite}"); // true
  print("doublePositive.isFinite: ${doublePositive.isFinite}"); // true
  print("doubleNegative.isFinite: ${doubleNegative.isFinite}"); // true

  print("-----------------------------------");

  // isInfinite 判断数字是不是正无穷大或负无穷大。
  print("infinitePlus.isInfinite: ${infinitePlus.isInfinite}"); // true
  print("infiniteMinus.isInfinite: ${infiniteMinus.isInfinite}"); // true
  print("nanRes.isInfinite: ${nanRes.isInfinite}"); // false
  print("intPositive.isInfinite: ${intPositive.isInfinite}"); // false
  print("intNegative.isInfinite: ${intNegative.isInfinite}"); // false
  print("doublePositive.isInfinite: ${doublePositive.isInfinite}"); // false
  print("doubleNegative.isInfinite: ${doubleNegative.isInfinite}"); // false

  print("-----------------------------------");

  // isNaN 判断数字是不是NaN
  print("infinitePlus.isNaN: ${infinitePlus.isNaN}"); // false
  print("infiniteMinus.isNaN: ${infiniteMinus.isNaN}"); // false
  print("nanRes.isNaN: ${nanRes.isNaN}"); // true
  print("intPositive.isNaN: ${intPositive.isNaN}"); // false
  print("intNegative.isNaN: ${intNegative.isNaN}"); // false
  print("doublePositive.isNaN: ${doublePositive.isNaN}"); // false
  print("doubleNegative.isNaN: ${doubleNegative.isNaN}"); // false

  print("-----------------------------------");

  // isNegative 判断数字是不是负数
  print("infinitePlus.isNegative: ${infinitePlus.isNegative}"); // false
  print("infiniteMinus.isNegative: ${infiniteMinus.isNegative}"); // true
  print("nanRes.isNegative: ${nanRes.isNegative}"); // false
  print("intPositive.isNegative: ${intPositive.isNegative}"); // false
  print("intNegative.isNegative: ${intNegative.isNegative}"); // true
  print("doublePositive.isNegative: ${doublePositive.isNegative}"); // false
  print("doubleNegative.isNegative: ${doubleNegative.isNegative}"); // true

  print("-----------------------------------");

  // sign 根据数字的符号和数值，返回-1，0或+1。
  print("infinitePlus.sign: ${infinitePlus.sign}"); // 1.0
  print("infiniteMinus.sign: ${infiniteMinus.sign}"); // -1.0
  print("nanRes.sign: ${nanRes.sign}"); // NaN
  print("intPositive.sign: ${intPositive.sign}"); // 1
  print("intNegative.sign: ${intNegative.sign}"); // -1
  print("doublePositive.sign: ${doublePositive.sign}"); // 1.0
  print("doubleNegative.sign: ${doubleNegative.sign}"); // -1.0
  print("zeroPositive.sign: ${zeroPositive.sign}"); // 0.0
  print("zeroNegative.sign: ${zeroNegative.sign}"); // -0.0

  print("-----------------------------------");

  // 常用方法
  // abs 返回num的绝对值
  print("infinitePlus.abs(): ${infinitePlus.abs()}"); // Infinity
  print("infiniteMinus.abs(): ${infiniteMinus.abs()}"); // Infinity
  print("nanRes.abs(): ${nanRes.abs()}"); // NaN
  print("intPositive.abs(): ${intPositive.abs()}"); // 1
  print("intNegative.abs(): ${intNegative.abs()}"); // 1
  print("doublePositive.abs(): ${doublePositive.abs()}"); // 2.0
  print("doubleNegative.abs(): ${doubleNegative.abs()}"); // 2.0
  print("zeroPositive.abs(): ${zeroPositive.abs()}"); // 0.0
  print("zeroNegative.abs(): ${zeroNegative.abs()}"); // 0.0

  print("-----------------------------------");

  // ceil
  print("3.3.ceil() = ${3.3.ceil()}"); // 4
  print("3.5.ceil() = ${3.5.ceil()}"); // 4
  print("3.7.ceil() = ${3.7.ceil()}"); // 4
  print("-3.3.ceil() = ${-3.3.ceil()}"); // -4
  print("-3.5.ceil() = ${-3.5.ceil()}"); // -4
  print("-3.7.ceil() = ${-3.7.ceil()}"); // -4
  print("-1.0.ceil() = ${-1.0.ceil()}"); // -1
  print("-0.7.ceil() = ${-0.7.ceil()}"); // -1
  print("-0.0.ceil() = ${-0.0.ceil()}"); // 0

  print("-----------------------------------");

  // ceilToDouble
  print("3.3.ceilToDouble() = ${3.3.ceilToDouble()}"); // 4.0
  print("3.5.ceilToDouble() = ${3.5.ceilToDouble()}"); // 4.0
  print("3.7.ceilToDouble() = ${3.7.ceilToDouble()}"); // 4.0
  print("-3.3.ceilToDouble() = ${-3.3.ceilToDouble()}"); // -4.0
  print("-3.5.ceilToDouble() = ${-3.5.ceilToDouble()}"); // -4.0
  print("-3.7.ceilToDouble() = ${-3.7.ceilToDouble()}"); // -4.0
  print("-1.0.ceilToDouble() = ${-1.0.ceilToDouble()}"); // -1.0
  print("-0.7.ceilToDouble() = ${-0.7.ceilToDouble()}"); // -1.0
  print("-0.0.ceilToDouble() = ${-0.0.ceilToDouble()}"); // -0.0

  print("-----------------------------------");

  // clamp
  print("3.3.clamp(0, 6) = ${3.3.clamp(0, 6)}"); // 3.3
  print("3.3.clamp(3.3, 6) = ${3.3.clamp(3.3, 6)}"); // 3.3
  print("3.3.clamp(0, 3.3) = ${3.3.clamp(0, 3.3)}"); // 3.3
  print("3.3.clamp(4, 6) = ${3.3.clamp(4, 6)}"); // 4
  print("3.3.clamp(0, 2) = ${3.3.clamp(0, 2)}"); // 2

  print("-----------------------------------");

  // compareTo

  print("3.compareTo(6) = ${3.compareTo(6)}"); // -1
  print("3.compareTo(3) = ${3.compareTo(3)}"); // 0
  print("3.compareTo(1) = ${3.compareTo(1)}"); // 1

  print("3.0.compareTo(6.0) = ${3.0.compareTo(6.0)}"); // -1
  print("3.0.compareTo(3) = ${3.0.compareTo(3)}"); // 0
  print("3.0.compareTo(3.0) = ${3.0.compareTo(3.0)}"); // 0
  print("3.compareTo(1.0) = ${3.compareTo(1.0)}"); // 1

  print("(-0.0).compareTo(0.0) = ${(-0.0).compareTo(0.0)}"); // -1
  print("(-0.0).compareTo(0) = ${(-0.0).compareTo(0)}"); // -1
  print(
      "double.nan.compareTo(double.nan) = ${double.nan.compareTo(double.nan)}"); // 0
  print(
      "double.nan.compareTo(double.infinity) = ${double.nan.compareTo(double.infinity)}"); // 1

  print("-----------------------------------");

  // floor
  print("3.floor() = ${3.floor()}"); // 3
  print("3.3.floor() = ${3.3.floor()}"); // 3
  print("3.5.floor() = ${3.5.floor()}"); // 3
  print("3.7.floor() = ${3.7.floor()}"); // 3
  print("-3.3.floor() = ${-3.3.floor()}"); // -3
  print("-3.5.floor() = ${-3.5.floor()}"); // -3
  print("-3.7.floor() = ${-3.7.floor()}"); // -3
  print("-1.0.floor() = ${-1.0.floor()}"); // -1
  print("-0.7.floor() = ${-0.7.floor()}"); // 0
  print("-0.0.floor() = ${-0.0.floor()}"); // 0

  print("-----------------------------------");

  // floorToDouble
  print("3.3.floorToDouble() = ${3.3.floorToDouble()}"); // 3.0
  print("3.5.floorToDouble() = ${3.5.floorToDouble()}"); // 3.0
  print("3.7.floorToDouble() = ${3.7.floorToDouble()}"); // 3.0
  print("-3.3.floorToDouble() = ${-3.3.floorToDouble()}"); // -3.0
  print("-3.5.floorToDouble() = ${-3.5.floorToDouble()}"); // -3.0
  print("-3.7.floorToDouble() = ${-3.7.floorToDouble()}"); // -3.0
  print("-1.0.floorToDouble() = ${-1.0.floorToDouble()}"); // -1.0
  print("-0.7.floorToDouble() = ${-0.7.floorToDouble()}"); // -0.0
  print("-0.0.floorToDouble() = ${-0.0.floorToDouble()}"); // -0.0
  print(
      "infinitePlus.floorToDouble() = ${infinitePlus.floorToDouble()}"); // Infinity
  print(
      "infiniteMinus.floorToDouble() = ${infiniteMinus.floorToDouble()}"); // -Infinity
  print("nanRes.floorToDouble() = ${nanRes.floorToDouble()}"); // NaN

  print("-----------------------------------");

  // remainder

  print("2.remainder(3) = ${2.remainder(3)}"); // 2
  print("2.0.remainder(3) = ${2.0.remainder(3)}"); // 2.0
  print("2.remainder(3.0) = ${2.remainder(3.0)}"); // 2.0
  print("2.0.remainder(3.0) = ${2.remainder(3.0)}"); // 2.0

  print("-----------------------------------");

  // round
  print("1.0.round() = ${1.0.round()}"); // 1
  print("1.2.round() = ${1.2.round()}"); // 1
  print("1.5.round() = ${1.5.round()}"); // 2
  print("1.7.round() = ${1.7.round()}"); // 2

  print("-0.0.round() = ${0.0.round()}"); // 0
  print("-0.2.round() = ${-0.2.round()}"); // 0
  print("-0.5.round() = ${-0.5.round()}"); // -1
  print("-0.7.round() = ${-0.7.round()}"); // -1
  print("-1.0.round() = ${-1.0.round()}"); // -1

  print("1.0.roundToDouble() = ${1.0.roundToDouble()}"); // 1.0
  print("1.2.roundToDouble() = ${1.2.roundToDouble()}"); // 1.0
  print("1.5.roundToDouble() = ${1.5.roundToDouble()}"); // 2.0
  print("1.7.roundToDouble() = ${1.7.roundToDouble()}"); // 2.0

  print("-0.0.roundToDouble() = ${0.0.roundToDouble()}"); // 0.0
  print("-0.2.roundToDouble() = ${-0.2.roundToDouble()}"); // -0.0
  print("-0.5.roundToDouble() = ${-0.5.roundToDouble()}"); // -1.0
  print("-0.7.roundToDouble() = ${-0.7.roundToDouble()}"); // -1.0
  print("-1.0.roundToDouble() = ${-1.0.roundToDouble()}"); // -1.0

  print(
      "infinitePlus.roundToDouble() = ${infinitePlus.roundToDouble()}"); // Infinity
  print(
      "infiniteMinus.roundToDouble() = ${infiniteMinus.roundToDouble()}"); // -Infinity
  print("nanRes.roundToDouble() = ${nanRes.roundToDouble()}"); // Na

  print("-----------------------------------");

  // to

  // toInt
  print("(0.1).toInt() = ${(0.1).toInt()}"); // 0
  print("(1.2).toInt() = ${(1.2).toInt()}"); // 1
  print("(1.5).toInt() = ${(1.5).toInt()}"); // 1
  print("(1.7).toInt() = ${(1.7).toInt()}"); // 1
  print("(1).toInt() = ${(1).toInt()}"); // 1
  print("(-0.1).toInt() = ${(-0.1).toInt()}"); // 0
  print("(-0.5).toInt() = ${(-0.5).toInt()}"); // 0
  print("(-0.7).toInt() = ${(-0.7).toInt()}"); // 0
  print("(-0.0).toInt() = ${(-0.0).toInt()}"); // 0
  print("(-1.0).toInt() = ${(-1.0).toInt()}"); // -1

  print("-----------------------------------");

  // toDouble
  print("(0.1).toDouble() = ${(0.1).toDouble()}"); // 0.1
  print("(1.2).toDouble() = ${(1.2).toDouble()}"); // 1.2
  print("(1.5).toDouble() = ${(1.5).toDouble()}"); // 1.5
  print("(1.7).toDouble() = ${(1.7).toDouble()}"); // 1.7
  print("(1).toDouble() = ${(1).toDouble()}"); // 1.0
  print("(-0.1).toDouble() = ${(-0.1).toDouble()}"); // -0.1
  print("(-0.5).toDouble() = ${(-0.5).toDouble()}"); // -0.5
  print("(-0.7).toDouble() = ${(-0.7).toDouble()}"); // -0.7
  print("(-0.0).toDouble() = ${(-0.0).toDouble()}"); // -0.0
  print("(-1.0).toDouble() = ${(-1.0).toDouble()}"); // -1.0
  print("infinitePlus.toDouble() = ${infinitePlus.toDouble()}"); // Infinity
  print("infiniteMinus.toDouble() = ${infiniteMinus.toDouble()}"); // -Infinity
  print("nanRes.toDouble() = ${nanRes.toDouble()}"); // NaN

  print("-----------------------------------");

  // toString
  print("(0.000001).toString() = \"${(0.000001).toString()}\""); // "0.000001"
  print("(0.0000001).toString() = \"${(0.0000001).toString()}\""); // "1e-7"
  print(
      "(111111111111111111111.0).toString() = \"${(111111111111111111111.0).toString()}\""); // "111111111111111110000.0"
  print(
      "(100000000000000000000.0).toString() = \"${(100000000000000000000.0).toString()}\""); // "100000000000000000000.0"
  print(
      "(1000000000000000000000.0).toString() = \"${(1000000000000000000000.0).toString()}\""); // "1e+21"
  print(
      "(1111111111111111111111.0).toString() = \"${(1111111111111111111111.0).toString()}\""); // "1.1111111111111111e+21"
  print("1.toString() = \"${1.toString()}\""); // "1"
  print(
      "1111111111111111111.toString() = \"${1111111111111111111.toString()}\""); // "1111111111111111111"
  print(
      "1000000000000000000.toString() = \"${1000000000000000000.toString()}\""); // "1000000000000000000"
  print("1.234e5.toString() = \"${1.234e5.toString()}\""); // "123400.0"
  print("1234.5e6.toString() = \"${1234.5e6.toString()}\""); // "1234500000.0"
  print("12.345e67.toString() = \"${12.345e67.toString()}\""); // 1.2345e+68"
  print(
      "infinitePlus.toString() = \"${infinitePlus.toString()}\""); // "Infinity"
  print(
      "infiniteMinus.toString() = \"${infiniteMinus.toString()}\""); // "-Infinity"
  print("nanRes.toString() = \"${nanRes.toString()}\""); // NaN"

  print("-----------------------------------");

  // toStringAsExponential
  print("1.toStringAsExponential() = \"${1.toStringAsExponential()}\""); // "1e+0"
  print("1.toStringAsExponential(3) = \"${1.toStringAsExponential(3)}\""); // "1.000e+0"
  print("123456.toStringAsExponential() = \"${123456.toStringAsExponential()}\""); // "1.23456e+5"
  print("123456.toStringAsExponential(3) = \"${123456.toStringAsExponential(3)}\""); // "1.235e+5"
  print("123456.toStringAsExponential(0) = \"${123456.toStringAsExponential(0)}\""); // "1e+5"

  print("-----------------------------------");
  
  // toStringAsFixed
  
  print("1.toStringAsFixed(3) = \"${1.toStringAsFixed(3)}\""); // "1.000"
  print("(4321.12345678).toStringAsFixed(3) = \"${(4321.12345678).toStringAsFixed(3)}\""); // "4321.123"
  print("(4321.12345678).toStringAsFixed(5) = \"${(4321.12345678).toStringAsFixed(5)}\""); // "4321.12346"
  print("(123456789012345678901.0).toStringAsFixed(3) = \"${(123456789012345678901.0).toStringAsFixed(3)}\""); // "123456789012345683968.000"
  print("(1000000000000000000000.0).toStringAsFixed(3) = \"${(1000000000000000000000.0).toStringAsFixed(3)}\""); // "1e+21"
  print("5.25.toStringAsFixed(0) = \"${5.25.toStringAsFixed(0)}\""); // "5"

  print("-----------------------------------");
  
  // toStringAsPrecision
  print("1.toStringAsPrecision(2) = \"${1.toStringAsPrecision(2)}\""); // "1.0"
  print("1e15.toStringAsPrecision(3) = \"${1e15.toStringAsPrecision(3)}\""); // "1.00e+15"
  print("1234567.toStringAsPrecision(3) = \"${1234567.toStringAsPrecision(3)}\""); // "1.23e+6"
  print("1234567.toStringAsPrecision(9) = \"${1234567.toStringAsPrecision(9)}\""); // "1234567.00"
  print("(12345678901234567890.0).toStringAsPrecision(20) = \"${(12345678901234567890.0).toStringAsPrecision(20)}\""); // "12345678901234567168"
  print("(12345678901234567890.0).toStringAsPrecision(20) = \"${(12345678901234567890.0).toStringAsPrecision(14)}\""); // "1.2345678901235e+19"
  print("0.00000012345.toStringAsPrecision(15) = \"${0.00000012345.toStringAsPrecision(15)}\""); // "1.23450000000000e-7"
  print("0.0000012345.toStringAsPrecision(15) = \"${0.0000012345.toStringAsPrecision(15)}\""); // "0.00000123450000000000"

  print("-----------------------------------");
  
  // truncate
  print("1.truncate() = ${1.truncate()}"); // 1
  print("(1.222).truncate() = ${(1.222).truncate()}"); // 1
  print("(0.222).truncate() = ${(0.222).truncate()}"); // 0
  print("(-0.222).truncate() = ${(-0.222).truncate()}"); // 0
  print("(-1.222).truncate() = ${(-1.222).truncate()}"); // -1

  print("-----------------------------------");
  
  // truncate
  print("1.truncateToDouble() = ${1.truncateToDouble()}"); // 1.0
  print("(1.0).truncateToDouble() = ${(1.0).truncateToDouble()}"); // 1.0
  print("(1.222).truncateToDouble() = ${(1.222).truncateToDouble()}"); // 1.0
  print("(0.222).truncateToDouble() = ${(0.222).truncateToDouble()}"); // 0.0
  print("(-0.222).truncateToDouble() = ${(-0.222).truncateToDouble()}"); // -0.0
  print("(-1.222).truncateToDouble() = ${(-1.222).truncateToDouble()}"); // -1.0
  print("infinitePlus.truncateToDouble() = ${infinitePlus.truncateToDouble()}"); // Infinity
  print("infiniteMinus.truncateToDouble() = ${infiniteMinus.truncateToDouble()}"); // -Infinity
  print("nanRes.truncateToDouble() = ${nanRes.truncateToDouble()}"); // -NaN
  
  // operate
  var num1 = 1;
  var num2 = 3;
  
  print("$num1 % $num2 = ${num1 % num2}"); // 1
  print("$num1 * $num2 = ${num1 * num2}"); // 3
  print("$num1 + $num2 = ${num1 + num2}"); // 4
  print("$num1 - $num2 = ${num1 - num2}"); // -2
  print("$num1 < $num2 = ${num1 < num2}"); // true
  print("$num1 <= $num2 = ${num1 <= num2}"); // true
  print("$num1 > $num2 = ${num1 > num2}"); // false
  print("$num1 >= $num2 = ${num1 >= num2}"); // false
  print("$num1 == $num2 = ${num1 == num2}"); // false
  print("-$num1  = ${-num1}");
  print("$num1  ~/ $num2 = ${num1  ~/ num2}"); // 0
  print("1.0  ~/ 3.0 = ${1.0  ~/ 3.0}"); // 0
  
  // parse
  
  var p1 = num.parse("1.0a",(input){
    return 2;
  }); // 2
  var p2 = num.tryParse("1.0a") ?? 2;
  print("p1 = $p1");
  print("p2 = $p2");

  print("-----------------------------------");
  
  // int
  
  // bitLength
  print("3.bitLength = ${3.bitLength}"); // 00000011
  print("2.bitLength = ${2.bitLength}"); // 00000010
  print("1.bitLength = ${1.bitLength}"); // 00000001
  print("0.bitLength = ${0.bitLength}"); // 00000000
  print("(-1).bitLength = ${(-1).bitLength}"); // 11111111
  print("(-2).bitLength = ${(-2).bitLength}"); // 11111110
  print("(-3).bitLength = ${(-3).bitLength}"); // 11111101
  print("(-4).bitLength = ${(-4).bitLength}");  // 11111100

  // isEven
  print("(1).isEven = ${(1).isEven}");  // false
  print("(2).isEven = ${(2).isEven}");  // true

  // isOdd
  print("(1).isOdd = ${(1).isOdd}");  // true
  print("(2).isOdd = ${(2).isOdd}");  // false
  
  // gcd
  print("3.gcd(12) = ${3.gcd(12)}"); // 3
  
  // modInverse
  print("5.modInverse(14) = ${5.modInverse(14)}"); // 3

  
  
}
