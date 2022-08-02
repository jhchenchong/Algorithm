import Foundation

// MARK: - TreeNode

/// 验证二叉搜索树
/// https://leetcode.cn/problems/validate-binary-search-tree

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValidBST(root, nil, nil)
    }

    func isValidBST(_ root: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {
        if root == nil { return true }

        if min != nil, root!.val <= min!.val { return false }
        if max != nil, root!.val >= max!.val { return false }

        return isValidBST(root?.left, min, root) && isValidBST(root?.right, root, max)
    }
}
