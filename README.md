# 语言特性


- Dart所有的东西都是对象，即使是数字numbers、函数function、null也都是对象，所有的对象都继承自Object类。
- Dart动态类型语言, 尽量给变量定义一个类型，会更安全，没有显示定义类型的变量在 debug 模式下会类型会是 dynamic(动态的)。
- Dart 在 running 之前解析你的所有代码，指定数据类型和编译时的常量，可以提高运行速度。
- Dart中的类和接口是统一的，类即接口，你可以继承一个类，也可以实现一个类（接口），自然也包含了良好的面向对象和并发编程的支持。
- Dart 没有 public、private、protected 这些关键字，变量名以"_"开头意味着对它的 lib 是私有的。
- 没有初始化的变量都会被赋予默认值 null。
- final的值只能被设定一次。const 是一个编译时的常量，可以通过 const 来创建常量值，var c=const[];，这里 c 还是一个变量，只是被赋值了一个常量值，它还是可以赋其它值。实例变量可以是 final，但不能是 const。
- 编程语言并不是孤立存在的，Dart也是这样，他由语言规范、虚拟机、类库和工具等组成：
<br>
    - SDK：SDK 包含 Dart VM、dart2js、Pub、库和工具。
    - Dartium：内嵌 Dart VM 的 Chromium ，可以在浏览器中直接执行 dart 代码。
    - Dart2js：将 Dart 代码编译为 JavaScript 的工具。
    - Dart Editor：基于 Eclipse 的全功能 IDE，并包含以上所有工具。支持代码补全、代码导航、快速修正、重构、调试等功能。

# 变量与常量

## 变量声明与初始化

在`Dart`中使用关键字`var`声明一个变量。

```
var name = 'teaphy';
```

变量是对存储引用。名为`name`的变量包含对字符串对象的引用，值为“Bob”。

在Dart中，自动推断数据的类型是其一大特性。比如，名为`name`的变量的类型被推断为`String`,也可以指定数据类型。如果对象类型不是单一类型，可以指定类型为 `Object`或`dynamic`。其中，`Object`为所有对象的基类，而`dynamic`是声明动态类型的关键字。

```
dynamic name = 'teaphy';
```

如果显示的指定变量的类型，可以这么声明：

```
var name = 'teaphy';
```

## 默认值


由于在Dart中所有的东西都是对象，即使是数字(`numbers`)、函数(`function`)、`null`也都是对象，而所有的对象都继承自Object类。因而，未初始化的变量的默认值为`null`。



```
// 未初始化的变量的默认值为`null`

int intDef;
String strDef;
bool boolDef;
Function funcDef;
Person person;


print("intDef: $intDef");
print("strDef: $strDef");
print("boolDef: $boolDef");
print("funcDef: $funcDef");
print("person: $person");

// Log
intDef: null
strDef: null
boolDef: null
funcDef: null
person: null
```


## final &  const

如果您从未打算更改一个变量，那么使用`final`或`const`，不是`var`，也不是一个类型。一个`final`变量只能被初始化一次;`const`变量是一个编译时常量，(Const变量是隐式的final)。

- final的顶级或类变量在第一次使用时被初始化。

- 被final修饰的顶级变量或类变量在第一次声明的时候就需要初始化。