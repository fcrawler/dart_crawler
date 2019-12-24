
void main() {

  // 常用属性
  // 正无穷大
  var infinitePlus = double.infinity;
  // 负无穷大
  var infiniteMinus = -double.infinity;
  var nanRes =  double.nan;
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
  print("double.nan.compareTo(double.nan) = ${double.nan.compareTo(double.nan)}"); // 0
  print("double.nan.compareTo(double.infinity) = ${double.nan.compareTo(double.infinity)}"); // 1
}