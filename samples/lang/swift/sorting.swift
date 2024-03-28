
/// 冒泡排序
func bubbleSort(_ nums: [Int]) -> [Int] {
    var nums = nums
    let count = nums.count
    for i in 0..<count {
      for j in 0..<(count - i - 1) {
        // 每次比较交换两个元素
        guard (nums[j] > nums[j + 1]) else { continue }
        let temp = nums[j + 1]
        nums[j + 1] = nums[j]
        nums[j] = temp
      }
    }
    return nums;
}

let nums = [3, 5, 7, 1, 8, 9, 0, 2, 6, 4]

print("raw:\t \(nums)")
print("bublle:\t \(bubbleSort(nums))")
