# `iOS` 编译器

## `LLVM`



## `Swift` 编译器 `swiftc`

### `SIL`(Swift Intermediate Language)

- [SIL](https://github.com/apple/swift/tree/main/lib/SIL)
- [2020-06-27 Swift编译器中间码SIL](https://juejin.cn/post/6844904200493596680)

```shell
# -emit-silgen : 将 swift 源码转化为 raw(原始的) SIL 文件
$ swiftc -emit-silgen Source.swift -o Source.sil
# -emit-sil : 将 raw SIL 文件转化为 canonical(规范的) SIL 文件
$ swiftc Source.sil -emit-sil  > Source-canonical.sil
#   直接将 swift 源码转化为 canonical SIL 文件
$ swiftc Source.swift -emit-sil  > Source-canonical.sil
```

## `iOS` 应用启动 `mian` 函数前后都做了什么？

## `Static Framework` vs `Dynamic Framework`