import Foundation

// MARK: - TreeNode

/// 二叉树的中序遍历
/// https://leetcode.cn/problems/binary-tree-inorder-traversal

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }

    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// MARK: - Solution

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else {
            return result
        }
        result.append(contentsOf: inorderTraversal(root.left))
        result.append(root.val)
        result.append(contentsOf: inorderTraversal(root.right))
        return result
    }

    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root != nil, root!.left != nil {
            result.append(contentsOf: inorderTraversal(root!.left))
        }
        if root != nil {
            result.append(root!.val)
        }
        if root != nil, root!.right != nil {
            result.append(contentsOf: inorderTraversal(root!.right))
        }
        return result
    }

    var result = [Int]()

    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        traverse(root)
        return result
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        traverse(root.left)
        result.append(root.val)
        traverse(root.right)
    }
}

let root = TreeNode(1, nil, TreeNode(2, TreeNode(3, nil, nil), nil))

Solution().inorderTraversal(root)
Solution().inorderTraversal1(root)
Solution().inorderTraversal2(root)
