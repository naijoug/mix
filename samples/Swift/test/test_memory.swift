
// - [Swift Enum-内存初探](https://juejin.cn/post/7209852595002212410)

// 原始值枚举

enum Color {
    case red
    case yellow
    case blue
}

func test() {
    print(">>> test1")

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
    print(">>> test2")

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
    print(">>> test3")
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
    print(">>>> test4")
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
    print(">>>> test5")
    let c = Color5.red
    _ = c.desc()       // "desc"
    _ = Color5.staticDesc()  // "staticDesc"
    _ = c.intValue
    print(MemoryLayout.size(ofValue: c))
}

test5()