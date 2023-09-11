//: [Previous](@previous)

//: ## Queues (队列)

// 容器协议
protocol Container  {
    var isEmpty: Bool { get }
    var count: Int { get }
}

//: Stack (栈)
/*:
 * LIFO (Last-In First-Out) : 后进先出
 * 只允许操作栈顶元素
    - push : 栈顶压入元素
    - pop : 栈顶弹出元素
    - peek : 获取栈顶元素，但是不弹出
 */

protocol Stack : Container {
    associatedtype Item
    mutating func push(item: Item)
    mutating func pop() -> Item?
    func peek() -> Item?
}

struct ArrayStack<T> : Stack {
    private var items = [T]()
    
    var isEmpty: Bool { return items.isEmpty }
    var count: Int { return items.count }
    
    mutating func push(item: T)  {
        items.append(item)
    }
    mutating func pop() -> T?  {
        return isEmpty ? nil : items.removeLast()
    }
    func peek() -> T? {
        return items.last
    }
}
var stack = ArrayStack<Int>()
stack.push(item: 11)
stack.push(item: 22)
stack.pop()
stack.peek()
stack.count
stack.pop()
stack.isEmpty

//: Queue (队列)
/*:
 * FIFO(First-In First-Out) : 先进先出
 * 只能操作队头和队尾元素
    - enqueue : 入列
    - dequeue : 出列
    - peek : 取得队列首部元素，但是不出列
 */

protocol Queue : Container {
    associatedtype Item
    mutating func enqueue(item: Item)
    mutating func dequeue() -> Item?
    func peek() -> Item?
}
// 数组队列实现
struct ArrayQueue<T> : Queue {
    private var items = [T]()
    var isEmpty: Bool { return items.isEmpty }
    var count: Int { return items.count }
    
    // 入列时，数组不扩容时，时间复杂度为 O(1) ; 遇到数组扩容时为O(n)，仅偶然发生一次，所有平均仍然为 O(1)
    mutating func enqueue(item: T) {
        items.append(item)
    }
    // 出列时，从队尾删除，后面数据需要移位，始终为 O(n)
    mutating func dequeue() -> T? {
        return isEmpty ? nil : items.removeFirst()
    }
    func peek() -> T? {
        return items.first
    }
}
var queue = ArrayQueue<String>()
queue.enqueue(item: "11")
queue.enqueue(item: "22")
queue.enqueue(item: "33")
queue.dequeue()
queue.dequeue()

// 更高效的数组队列
//  * 每次出列时，不移动数组后面元素，仅标记为空
//  * 定期修剪一次前面空元素(解决前面空元素无限递增的问题)
struct EfficientArrayQueue<T> : Queue {
    private var items = [T?]()
    private var head = 0
    var isEmpty: Bool { return count == 0 }
    var count: Int { return items.count - head }
    
    mutating func enqueue(item: T) {
        items.append(item)
    }
    mutating func dequeue() -> T? {
        guard head < items.count, let item = items[head] else {
            return nil
        }
        // 将头元素标记为空，移动头索引
        items[head] = nil
        head += 1
        // 定期移动元素到队首
        let percent = Double(head)/Double(items.count)
        if items.count > 8 && percent > 0.25 {
            print("prune items...")
            items.removeFirst(head) // 删除头元素之前的空元素
            head = 0
        }
        return item
    }
    func peek() -> T? {
        return isEmpty ? nil : items[head]
    }
}
var efficientQueue = EfficientArrayQueue<Int>()
efficientQueue.enqueue(item: 11)
efficientQueue.enqueue(item: 22)
efficientQueue.enqueue(item: 33)
efficientQueue.enqueue(item: 44)
efficientQueue.enqueue(item: 55)
efficientQueue.enqueue(item: 66)
efficientQueue.enqueue(item: 77)
efficientQueue.enqueue(item: 88)
efficientQueue.enqueue(item: 99)
efficientQueue.dequeue()
efficientQueue
efficientQueue.dequeue()
efficientQueue
efficientQueue.peek()
efficientQueue
efficientQueue.dequeue() // 发生修剪
efficientQueue

//: Deque (双端队列)


//: Priority Queue (优先队列)
//: > 一个保持最重要的元素总是在最前面的队列


//: Ring Buffer (环形缓存区)
//: > 一个语义上的固定大小的环形缓冲区，实际使用的是一维序列头尾相接实现


//: [Next](@next)
