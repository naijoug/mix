
// 斐波纳契数列
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

// 迭代实现
func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    return fib(n - 1) + fib(n - 2)
}

// 尾递归实现
func fibTail(_ n: Int, current: Int = 0, next: Int = 1) -> Int {
    guard n != 0 else { return current }
    return fibTail(n - 1, current: next, next: current + next)
}

// 迭代实现
func fibTraverse(_ n: Int) -> Int {
      guard n > 1 else { return n }
      var pre = 0
      var current = 1
      for _ in 2...n {
           let next = pre + current
           pre = current
           current = next
      }
      return current
  }

print("fib: >>>")
print("fib: \(fib(10))")
print("fibTail: \(fibTail(40))")
print("fibTraverse: \(fibTraverse(40))")
