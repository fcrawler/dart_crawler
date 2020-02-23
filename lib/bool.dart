void main() {


	print("true.runtimeType = ${true.runtimeType}"); // bool
	print("false.runtimeType = ${false.runtimeType}"); // bool
	
	
	bool aaa = true;
	bool bbb = false;
	print("aaa.runtimeType = ${aaa.runtimeType}"); // bool
	print("bbb.runtimeType = ${bbb.runtimeType}"); // bool

	print("aaa");
	
	print("--------------------");

	


  print("true & true = ${true & true}"); // true
	print("true & false = ${true & false}"); // false
	print("false & true = ${false & true}"); // false
	print("false & false = ${false & false}"); // false
	
	print("true | true = ${true | true}"); // true
	print("true | false = ${true | false}"); // true
	print("false | true = ${false | true}"); // true
	print("false | false = ${false | false}"); // false
	
	print("true ^ true = ${true ^ true}"); // false
	print("true ^ false = ${true ^ false}"); // true
	print("false ^ true = ${false ^ true}"); // true
	print("false ^ false = ${false ^ false}"); // false
	
}