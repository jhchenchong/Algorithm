import Foundation

// MARK: - TreeNode

/// 把二叉搜索树转换为累加树
/// https://leetcode.cn/problems/convert-bst-to-greater-tree
/// https://leetcode.cn/problems/binary-search-tree-to-greater-sum-tree

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
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }

    var sum: Int = 0

    func traverse(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        traverse(root.right)
        sum += root.val
        root.val = sum
        traverse(root.left)
    }
}
