//: [Previous](@previous)

//: ## Sorting (排序)
/*:
 * 目标：将一个数组按照从低到高(或从高到低)来排序
 */

let numbers = [8, 3, 5, 4, 6]
let numbers2 = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
let strings = ["b", "a", "d", "c", "e"]
numbers.sorted()

//: ### Basic Sorts (基础排序)

//: Insertion Sort (插入排序)
/*:
 * 原理：不断地从未排序数组中，插入到已排序的目标数组中
 * 稳定性：稳定的排序算法
 * 时间复杂度：O(n^2)
 * 适用于：小数组排序，或者部分有序的排序
 */
func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    var items = array
    for i in stride(from: 1, to: items.count, by: 1) {
        for j in stride(from: i, to: 0, by: -1) {
            if items[j] >= items[j - 1] {
                break
            }
            items.swapAt(j, j - 1) // 使用 swap
        }
    }
    return items
}
insertionSort(numbers)
insertionSort(numbers2)

// 通用插入排序算法
func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var items = array
    for i in 1..<items.count {
        let temp = items[i] // 不使用 swap
        var j = i
        while j > 0 && isOrderedBefore(temp, items[j - 1]) {
            items[j] = items[j - 1]
            j -= 1
        }
        items[j] = temp
    }
    return items
}
insertionSort(numbers, <)
insertionSort(numbers, >)
insertionSort(numbers2, <)
insertionSort(strings, >)

//: Selection Sort (选择排序)

//: Shell Sort (希尔排序)

//: ### Fast Sorts (快速排序)

//: Quicksort (快速排序)

//: Merge Sort (归并排序)
/*:
 * 原理：分而治之
    - 分割：将未排序序列一分为二，之一分割直到序列只有一个数据(有序)
    - 合并：然后合并已排序序列
 * 时间复杂度：O(n log n) (最好最坏一样)
 * 特点：
    - 与数组是否排序无关，都需要同样数量的分割和合并
    - 需要一个临时数组，无法就地排序
 */

// 自上而下
//  * 先分割，再合并
func mergeSortUpBottom<T: Comparable>(_ array: [T]) -> [T] {
    var items = array
    
    return items
}
// 合并算法
func merge<T: Comparable>(leftArray: [T], rightArray: [T]) -> [T] {
    var orderedArray = [T]()
    
    return orderedArray
}

// 自下而上
// * 不用分割，直接开始合并单独的数组元素
func mergeSortBottomUp<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    
    return nil
}


//: Heap Sort (堆排序)

//: ### Hybrid sorts (混合排序)

//: Introsort (内省排序)

//: Special-purpose sorts (特殊的排序)

//: Counting Sort (计数排序)

//: Radix Sort (基数排序)

//: Topological Sort (拓扑排序)

//: ### Bad sorting algorithms (don't use these!) (不好的排序，知道就行，不要使用！)

//: Bubble Sort (冒泡排序)

//: Slow Sort (慢速排序)

//: [Next](@next)
