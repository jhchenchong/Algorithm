import Foundation

/// 斐波拉契数
///  https://leetcode.cn/problems/fibonacci-number

class Solution {
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var first = 0
        var second = 1
        var sum = 0
        for _ in 0 ..< n - 1 {
            sum = first + second
            first = second
            second = sum
        }
        return second
    }
}

Solution().fib(60)
