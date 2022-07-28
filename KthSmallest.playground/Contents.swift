import Foundation

// MARK: - TreeNode

/// 二叉搜索树中第k小的元素
///  https://leetcode.cn/problems/kth-smallest-element-in-a-bst

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

// MARK: - Solution

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root, k)
        return res
    }

    var res: Int = 0
    var rank: Int = 0

    func traverse(_ root: TreeNode?, _ k: Int) {
        guard let root = root else {
            return
        }
        traverse(root.left, k)
        rank += 1
        if k == rank {
            res = root.val
            return
        }
        traverse(root.right, k)
    }
}
