
// - [Swift 的可选值优化](https://juejin.cn/post/7244809939839434808)

/// 以下方法取 value 的地址，并从地址处向后取它在内存中的大小 size 个字节，转为对应的数组
func bytes<T>(of value: T) -> [UInt8] {
    var value = value
    let size = MemoryLayout<T>.size
    return withUnsafePointer(to: &value, {
        $0.withMemoryRebound(
            to: UInt8.self,
            capacity: size,
            {
                Array(UnsafeBufferPointer(
                    start: $0, count: size))
            })
    })
}

// => Int
//      0 在 Int 中的一个值
//      Int? 比 Int 多一个字节表示 None

var n: Int = 1
print("Int == 1    => \(bytes(of: n))")    // [1, 0, 0, 0, 0, 0, 0, 0] 
n = 2
print("Int == 2    => \(bytes(of: n))")    // [2, 0, 0, 0, 0, 0, 0, 0] 

var o: Int?
print("Int? == nil => \(bytes(of: o))")    // [0, 0, 0, 0, 0, 0, 0, 0, 1]
o = 1
print("Int? == 1   => \(bytes(of: o))")    // [1, 0, 0, 0, 0, 0, 0, 0, 0]
o = 2
print("Int? == 2   => \(bytes(of: o))")    // [2, 0, 0, 0, 0, 0, 0, 0, 0]

// => Struct

struct S {
    var a: Int = 2
    var b: Int = 3
}
struct SO {
    var a: Int? = 2
    var b: Int? = 3
}

print("struct N =>  \(bytes(of: S()))")  // [2, 0, 0, 0, 0, 0, 0, 0, 
                                         //  3, 0, 0, 0, 0, 0, 0, 0]
print("struct SO => \(bytes(of: SO()))") // [2, 0, 0, 0, 0, 0, 0, 0, 0, 91, 76, 136, 234, 127, 0, 0, 
                                         //  3, 0, 0, 0, 0, 0, 0, 0, 0]
let so = SO(a: nil, b: nil)
print("struct SO => \(bytes(of: so))")   // [0, 0, 0, 0, 0, 0, 0, 0, 1, 214, 193, 92, 157, 127, 0, 0,  
                                         //  0, 0, 0, 0, 0, 0, 0, 0, 1]  

// nil 的优化

// => Bool
//    使用 2 表示 None

var b: Bool = true
print("Bool == true   => \(bytes(of: b))") // [1]
b = false
print("Bool == false  => \(bytes(of: b))") // [0] 

var bo: Bool? 
print("Bool? == nil   => \(bytes(of: bo))") // [2]
bo = true
print("Bool? == true  => \(bytes(of: bo))") // [1]
bo = false
print("Bool? == false => \(bytes(of: bo))") // [0]

// => String
//      使用 0 表示 None
//      短字符串 : 存储指针地址 (OC Tagged Pointer)
//      长字符串 : 存储在堆中

var str: String = ""
print("String == \"\" => \(bytes(of: str))")  // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224]
str = "abc"
print("String == abc  => \(bytes(of: str))")  // [97, 98, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227]
str = "012"
print("String == 012 => \(bytes(of: str))")  // [48, 49, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227]
str = "This is a so long long long long long long long long long string."
print("A long String => \(bytes(of: str))")  // [65, 0, 0, 0, 0, 0, 0, 208, 80, 113, 82, 18, 1, 0, 0, 128]

var stro: String?
print("String? == nil => \(bytes(of: stro))") // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
stro = "abc"
print("String? == abc => \(bytes(of: stro))") // [97, 98, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227]
stro = "012"
print("String? == 012 => \(bytes(of: stro))") // [48, 49, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227]
stro = "This is a so long long long long long long long long long string."
print("A long String? => \(bytes(of: stro))") // [65, 0, 0, 0, 0, 0, 0, 208, 80, 113, 82, 18, 1, 0, 0, 128]

// => Class
//      类存储指针类型，空指针表示 None
//      占用 8 个字节 

class C {
    var a: Int = 2
    var b: Int = 3
}

class CO {
    var a: Int?
    var b: Int?

    init(a: Int? = nil, b: Int? = nil) {
        self.a = a
        self.b = b
    }
}

print("class C => \(bytes(of: C()))")   // [176, 222, 248, 200, 172, 127, 0, 0]
let co = CO(a: 2, b: 3)
print("class CO => \(bytes(of: co))")   // [176, 211, 245, 200, 172, 127, 0, 0]
print("class CO => \(bytes(of: CO()))") // [96, 206, 245, 200, 172, 127, 0, 0]

//  => Enum
//      不带关联值的枚举，枚举有限，后面有空位
//      待关联值的枚举特殊

enum Edge {
    case left
    case right
    case top
    case bottom
}

var e: Edge?
print("enum == nil     => \(bytes(of: e))") // [4]
e = .left
print("enum == .left   => \(bytes(of: e))") // [0]
e = .bottom
print("enum == .bottom => \(bytes(of: e))") // [3]

enum Level {
    case info
    case debug
    case warning
    case error
    case custom(String)
}

var l: Level?
print("enum == nil     => \(bytes(of: l))") // [0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0]
l = .info
print("enum == .info   => \(bytes(of: l))") // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
l = .debug
print("enum == .debug  => \(bytes(of: l))") // [0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0]
l = .error
print("enum == .error  => \(bytes(of: l))") // [0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0]
l = .custom("verbose")
print("enum custom     => \(bytes(of: l))") // [118, 101, 114, 98, 111, 115, 101, 0, 0, 0, 0, 0, 0, 0, 0, 231]