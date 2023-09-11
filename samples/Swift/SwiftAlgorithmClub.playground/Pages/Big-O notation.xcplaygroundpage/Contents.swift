//: Big-O notation (大 O 表示法)

//: Big-O 表示法
//  * 用于粗略的计算算法的运行时间和使用内存量
//  * n 表示要处理的数据项的数量
var n = 100

//: O(1) : constant(常量级)
//  * 最好的
//  * 无论数据多少花费的时间都相同

// 通过索引访问数组
let array = [1, 2, 3, 4, 5]
let value = array[3]
// 栈的 push 和 pop

//: O(log n) : logarithmic(对数级)
//  * 非常好
//  * 每次迭代时数据量减半

var j = 1
while j < n {
    j *= 2
}

// 二进制搜索


//: O(n) : linear(线性级)
//  * 好性能
//  * 与 n 成正比

for i in stride(from: 0, to: n, by: 1) {
    print(i)
}
// 顺序搜索

//: O(n log n) : linearithmic
//  * 还可以

for _ in stride(from: 0, to: n, by: 1) {
    var j = 1
    while j < n {
        j *= 2
    }
}

for i in stride(from: 0, to: n, by: 1) {
    func index(after i: Int) -> Int? {
        return i < n ? i * 2 : nil
    }
    for j in sequence(first: 1, next: index(after:)) {
        print(j)
    }
}

// 通用排序算法 : 归并排序 、堆排序

//: O(n^2) : quadratic(平方级)
//  * 有点慢

// 嵌套循环
n = 10
for i in stride(from: 0, to: n, by: 1) {
    for j in stride(from: 0, to: n, by: 1) {
        print("\(i) \t-- \(j)")
    }
}
// 遍历二维数组
// 冒泡排序

//: O(n^3) : cubic(立方级)
//  * 差性能
n = 5
for i in stride(from: 0, to: n, by: 1) {
    for j in stride(from: 0, to: n, by: 1) {
        for k in stride(from: 0, to: n, by: 1) {
            print("\(i) \t-- \(j) \t-- \(k)")
        }
    }
}
// 矩阵算法

//: O(2^n) : exponential(指数级)
//  * 非常差

/** Towers of Hanoi - 汉诺塔(河内塔)问题
 *
 有三根杆子A，B，C。A杆上有 N 个 (N>1) 穿孔圆盘，盘的尺寸由下到上依次变小。
 要求按下列规则将所有圆盘移至 C 杆：
    - 每次只能移动一个圆盘；
    - 大盘不能叠在小盘上面。
 提示：可将圆盘临时置于 B 杆，也可将从 A 杆移出的圆盘重新移回 A 杆，但都必须遵循上述两条规则。
 问：如何移？最少要移动多少次？
 */
// 汉诺塔公式 : 2^n - 1 = 2 * (2^n-1 - 1) + 1 = (2^n-1 - 1) + 1 + (2^n-1 - 1)
func hanoi(n: Int, from: String, to: String, spare: String) {
    guard n > 1 else {
        print("\(from) -> \(to)")
        return
    }
    hanoi(n: n - 1, from: from, to: spare, spare: to)
    hanoi(n: 1, from: from, to: to, spare: spare)
    hanoi(n: n - 1, from: spare, to: to, spare: from)
}
hanoi(n: 3, from: "A", to: "B", spare: "C")

// Traveling Salesperson Problem (TSP) - 旅行推销员问题

//: O(n!) : factorial(阶乘级)
//  * 无法忍受的差
//  * 需要一百万年才能完成

// 阶乘级别函数
func nFactFunc(n: Int) {
    print("------ \(n)")
    for _ in stride(from: 0, to: n, by: 1) {
        nFactFunc(n: n - 1)
    }
}
nFactFunc(n: 5)

//: [Where to starts](@next)
