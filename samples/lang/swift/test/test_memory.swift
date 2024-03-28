
// 基础数据类型的内存布局

func test_data() {
    print(">>>> 基础数据类型的内存布局")
    print("Bool:")
    print(" - size:  \(MemoryLayout<Bool>.size)")
    print(" - stride: \(MemoryLayout<Bool>.stride)")
    print(" - alignment: \(MemoryLayout<Bool>.alignment)")

    print("Int:")
    print(" - size:  \(MemoryLayout<Int>.size)")
    print(" - stride: \(MemoryLayout<Int>.stride)")
    print(" - alignment: \(MemoryLayout<Int>.alignment)")

    print("Float:")
    print(" - size:  \(MemoryLayout<Float>.size)")
    print(" - stride: \(MemoryLayout<Float>.stride)")
    print(" - alignment: \(MemoryLayout<Float>.alignment)")

    print("Double:")
    print(" - size:  \(MemoryLayout<Double>.size)")
    print(" - stride: \(MemoryLayout<Double>.stride)")
    print(" - alignment: \(MemoryLayout<Double>.alignment)")

    print("Character:")
    print(" - size:  \(MemoryLayout<Character>.size)")
    print(" - stride: \(MemoryLayout<Character>.stride)")
    print(" - alignment: \(MemoryLayout<Character>.alignment)")

    print("String:")
    print(" - size:  \(MemoryLayout<String>.size)")
    print(" - stride: \(MemoryLayout<String>.stride)")
    print(" - alignment: \(MemoryLayout<String>.alignment)")
}
test_data()

// 结构体的内存布局

struct Size {
    var width = 0.0, height = 0.0
    var area = 0.0
    var sum: Float = 0

    func test() {
        print("area: \(area)")
    }
}
func test_struct() {
    print(">>>> 结构体的内存布局")
    print(" - size:  \(MemoryLayout<Size>.size)")
    print(" - stride: \(MemoryLayout<Size>.stride)")
    print(" - alignment: \(MemoryLayout<Size>.alignment)")

    let size = Size()
    print(">>> 结构体实例的内存布局")
    print(" - size: \(MemoryLayout.size(ofValue: size))")
    print(" - stride: \(MemoryLayout.stride(ofValue: size))")
    print(" - alignment: \(MemoryLayout.alignment(ofValue: size))")
}
test_struct()

// 类的内存布局

class Size2 {
    var width = 0.0, height = 0.0
    var area = 0.0
    var sum: Float = 0

    func test() {
        print("area: \(area)")
    }
}
func test_class() {
    print(">>>> 类的内存布局")
    print(" - size:  \(MemoryLayout<Size2>.size)")
    print(" - stride: \(MemoryLayout<Size2>.stride)")
    print(" - alignment: \(MemoryLayout<Size2>.alignment)")

    let size = Size2()
    print(">>> 类实例的内存布局")
    print(" - size: \(MemoryLayout.size(ofValue: size))")
    print(" - stride: \(MemoryLayout.stride(ofValue: size))")
    print(" - alignment: \(MemoryLayout.alignment(ofValue: size))")
}
test_class()

// - [Swift Enum-内存初探](https://juejin.cn/post/7209852595002212410)

// 原始值枚举

enum Color {
    case red
    case yellow
    case blue
}

func test() {
    print(">>> 原始枚举")

    let c1 = Color.red
    print(MemoryLayout.size(ofValue: c1)) // 1
    
    let c2 = Color.yellow
    print(MemoryLayout.size(ofValue: c2)) // 1
    
    let c3 = Color.blue
    print(MemoryLayout.size(ofValue: c3)) // 1
}

test()

// 带原始值的枚举

enum Color2: String {
    case red = "redColor"
    case yellow = "yellowColor"
    case blue = "blueColor"
}

func test2() {   
    print(">>> 带原始值的枚举")

    let c1 = Color2.red
    print(MemoryLayout.size(ofValue: c1)) // 1

    let c2 = Color2.yellow
    print(MemoryLayout.size(ofValue: c2)) // 1

    let c3 = Color2.blue
    print(MemoryLayout.size(ofValue: c3)) // 1
}

test2()

// 带关联值的枚举

enum Color3 {
    case red
    case green(val: Bool)
    case yellow(val1: Int, val2: Int32)
    case blue(val:Int)
}

func test3() {
    print(">>> 带关联值的枚举")
    let c1 = Color3.red
    print(MemoryLayout.size(ofValue: c1)) // 13

    let c2 = Color3.green(val: true)
    print(MemoryLayout.size(ofValue: c2)) // 13

    let c3 = Color3.yellow(val1: 9, val2: 22) 
    print(MemoryLayout.size(ofValue: c3)) // 13

    let c4 = Color3.blue(val: 14)
    print(MemoryLayout.size(ofValue: c4)) // 13
}

test3()

// 带特殊关联值的枚举

enum Color4 {
    case red
    case green(val: Bool)
    case blue(val: Bool)
}

func test4() {
    print(">>>> 带特殊关联值的枚举")
    let c1 = Color4.red
    print(MemoryLayout.size(ofValue: c1)) // 1
    
    let c2 = Color4.green(val: true)
    print(MemoryLayout.size(ofValue: c2)) // 1

    let c3 = Color4.blue(val: true)
    print(MemoryLayout.size(ofValue: c3)) // 1
}

test4()

// 枚举中的方法和计算属性

enum Color5 {
    case red
    case yellow
    case blue
  
    var intValue: Int {
        return 20
    }
    func desc() -> String {
        return "desc"
    }
    static func staticDesc() -> String {
        return "staticDesc"
    }
}

func test5() {
    print(">>>> 枚举中的方法和计算属性")
    let c = Color5.red
    _ = c.desc()       // "desc"
    _ = Color5.staticDesc()  // "staticDesc"
    _ = c.intValue
    print(MemoryLayout.size(ofValue: c))
}

test5()
