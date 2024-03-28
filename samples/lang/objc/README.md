
## Reference

- [isa && 元类 && 函数调用](https://minilv.github.io/2018/07/01/ias-class-metaClass/)

## Usage

> OC 的本质

```shell
# OC -> CPP
$  clang -rewrite-objc Person.m -o Person.cpp
```

```cpp
// line: 7999
struct NSObject_IMPL {
	Class isa;
};
// line: 92991
struct Person_IMPL {
	struct NSObject_IMPL NSObject_IVARS;
	int _age;
	double _height;
	NSString *name;
};

// OC 的类底层是使用结构体实现
```

> 一个 OC 对象占用几个字节？

```shell
(lldb) po obj
<NSObject: 0x100650ff0>

(lldb) memory read 0x100650ff0
0x100650ff0: 49 d0 73 80 ff ff 1d 01 00 00 00 00 00 00 00 00
```