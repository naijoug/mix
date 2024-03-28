//: [Protocols](@previous)

//: ## Generics : 泛型


//: The Problem That Generics Solve (泛型解决的问题)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//: Generic Functions (泛型函数)
//  * 泛型使用占位符(如: T)代替真正的类型
//  * 声明类型占位符使用尖括号 <>

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//func swapTwoInts(_ a: inout Int, _ b: inout Int)
//func swapTwoValues<T>(_ a: inout T, _ b: inout T)

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt1, &anotherInt1)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

//: Type Parameters (类型参数)
//  * <> 声明泛型类型参数
//  * 多个类型参数使用逗号 , 隔开

//: Naming Type Parameters (类型参数命名)
//  * 使用首字母大写的驼峰命名方式表示一个类型占位

//: Generic Types (泛型类型)

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let fromTheTop = stackOfStrings.pop()

//: Extending a Generic Type (扩展泛型类型)
//  * 扩展泛型类型，不需要提供泛型类型参数作为扩展定义的一部分
//  * 可以在扩展中直接使用泛型类型参数

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

//: Type Constraints (类型约束)
//  * 泛型类型约束 : 参数类型必须继承于特定类、遵循特定协议或协议组

// Type Constraint Syntax - 类型约束语法
class SomeClass {}
protocol SomeProtocol {}
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 函数定义
}
// swiftlint:disable for_where
// Type Constraints in Action - 类型约束行为
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
/**
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind { // 错误，需要实现 Equatable 协议的类型
            return index
        }
    }
    return nil
}
 */
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

//: Associated Types (关联类型)
//  * 关联类型 : 作为协议的一部分，为一种类型提供占位符名称
//  * 实现协议之前不会指定关联类型的实际类型
//  * associatedtype 关键字声明关联类型
//  * 关联类型使用大写驼峰命名法

// Associated Types in Action
protocol Container {
    associatedtype Item // 声明关联类型
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack1: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int // 将关联类型定义为具体的类型
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack1<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item: Element) { // 自动推断出协议关联对象类型为 Element
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// Extending an Existing Type to Specify an Associated Type - 扩展现有类型以指定关联类型
extension Array: Container {}

// Adding Constraints to an Associated Type - 将约束添加到关联类型

protocol Container1 {
    associatedtype Item: Equatable // 关联类型添加约束
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

// Using a Protocol in Its Associated Type’s Constraints - 在关联类型的约束中使用协议
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
extension Stack1: SuffixableContainer {
    func suffix(_ size: Int) -> Stack1 {
        var result = Stack1()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}
var stackOfInts = Stack1<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

extension IntStack1: SuffixableContainer {
    func suffix(_ size: Int) -> Stack1<Int> {
        var result = Stack1<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

//: Generic Where Clauses (泛型 where 从句)

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        if someContainer.count != anotherContainer.count {
            return false
        }
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
}

var stackOfStrings1 = Stack1<String>()
stackOfStrings1.push("uno")
stackOfStrings1.push("dos")
stackOfStrings1.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]
if allItemsMatch(stackOfStrings1, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

//: Extensions with a Generic Where Clause (扩展中使用泛型 where 从句)

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue) // 调用不了 isTop

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}
if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())

//: Associated Types with a Generic Where Clause (关联对象带有泛型 where 从句)

protocol Container2 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

//: Generic Subscripts - 泛型下标

extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}


//: [Automatic Reference Counting](@next)
