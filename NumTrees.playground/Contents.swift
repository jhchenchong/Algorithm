import Foundation

// MARK: - TreeNode

/// 不同的二叉搜索树
/// https://leetcode.cn/problems/unique-binary-search-trees

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// MARK: - Array2D

struct Array2D<T> {
    let columns: Int
    let rows: Int
    var array: [T]

    init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        self.array = .init(repeating: initialValue, count: rows*columns)
    }

    subscript(column: Int, row: Int) -> T {
        get {
            precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            return array[row*columns + column]
        }
        set {
            precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            array[row*columns + column] = newValue
        }
    }
}

// MARK: - Solution

class Solution {
    var memo = Array2D(columns: 0, rows: 0, initialValue: 0)

    func numTrees(_ n: Int) -> Int {
        memo = .init(columns: n + 1, rows: n + 1, initialValue: 0)
        return count(1, n)
    }

    func count(_ lo: Int, _ hi: Int) -> Int {
        print(lo, hi)
        if lo > hi {
            return 1
        }
        if memo[lo, hi] != 0 {
            return memo[lo, hi]
        }
        var result = 0
        for mid in lo ... hi {
            let left = count(lo, mid - 1)
            let right = count(mid + 1, hi)
            result += left*right
        }
        memo[lo, hi] = result
        return result
    }
}

// MARK: - Solution2

class Solution2 {
    var memo = [Int]()
    func numTrees(_ n: Int) -> Int {
        memo = .init(repeating: 0, count: n + 1)
        return count(1, n)
    }

    func count(_ lo: Int, _ hi: Int) -> Int {
        if memo[hi - lo + 1] != 0 {
            return memo[hi - lo + 1]
        }
        if lo > hi {
            return 1
        }
        var result = 0
        for i in lo ... hi {
            let left = count(lo, i - 1)
            let right = count(i + 1, hi)
            result += left*right
        }
        return result
    }
}
