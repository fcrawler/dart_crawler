import 'person.dart';

void main() {
  // 使用关键字`var`声明一个变量
  var name = "teaphy";
  
  
  var age;
  age = 10;
  
  print("age.type: ${age.runtimeType}");
  
  // 未初始化的变量的默认值为`null`
  int intDef;
  String strDef;
  bool boolDef;
  Function funcDef;
  Person person;
  
  // commit

  print("intDef: $intDef");
  print("strDef: $strDef");
  print("boolDef: $boolDef");
  print("funcDef: $funcDef");
  print("person: $person");
}
