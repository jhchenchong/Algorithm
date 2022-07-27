import Foundation

/// 两数之和
/// https://leetcode.cn/problems/two-sum

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        return []
    }
}

Solution().twoSum([2, 7, 11, 15], 9)
