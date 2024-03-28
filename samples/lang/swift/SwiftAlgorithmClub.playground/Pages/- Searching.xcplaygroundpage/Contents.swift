//: [The algorithms](@previous)

//: ## Searching (查找)
/*:
 * 目标 : 在数组中快速找到目标
 */

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]
let sortNumbers = numbers.sorted()
numbers.firstIndex(of: 43)
sortNumbers.firstIndex(of: 43)

//: Linear Search (线性查找)
//: > 从数组中查找某个元素
/*:
 * 原理 : 从数字开始遍历知道找到想要的数字
 * 时间复杂度 : O(n)
 */
func linearSearch<T: Equatable>(_ array: [T], key: T) -> Int? {
    for i in 0..<array.count {
        if key == array[i] {
            return i
        }
    }
    return nil
}
linearSearch(numbers, key: 43)

//: Binary Search (二分查找)
//: > 从已排序的数组中快速查找元素
/*:
 * 原理 : 分而治之，每次比较已排序数组的中间元素，排除一半的数组元素，快速缩小搜索范围
 * 时间复杂化 : O(log n) [+ 排序时间复杂度]
 * 好处 : 排序一次，可以搜索很多次
 */

// 二分查找(递归)
func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    }
    let midBound = (range.lowerBound + range.upperBound) / 2
    if array[midBound] > key {
        return binarySearch(array, key: key, range: range.lowerBound ..< midBound)
    }
    if array[midBound] < key {
        return binarySearch(array, key: key, range: (midBound + 1) ..< range.upperBound)
    }
    return midBound;
}
binarySearch(sortNumbers, key: 43, range: 0 ..< sortNumbers.count)

// 二分查找(循环)
func binarySearch<T: Comparable>(_ array: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count
    while lowerBound < upperBound {
        let midBound = (lowerBound + upperBound) / 2
        if array[midBound] > key {
            upperBound = midBound
        } else if array[midBound] < key {
            lowerBound = midBound + 1
        } else {
            return midBound
        }
    }
    return nil
}
binarySearch(sortNumbers, key: 43)


//: Count Occurrences (统计出现次数)
//: > 统计某个值在数组中的出现次数

//: Select Minimum / Maximum (查找最大 / 最小值)
//: > 找到数组中的最大／最小值

//: k-th Larget Element (第 K 大元素)
//: > 找到数组中的第 K 大元素，例如中位数

//: Selection Sampling (选取样本)
//: > 随机地从集合中选取一些元素作为样本

//: Union-Find (并查集)
//: > 保持一些不相交的集合，帮助你快速合并它们


//: [- String Search](@next)
