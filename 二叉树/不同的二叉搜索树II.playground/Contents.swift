import Foundation

// MARK: - TreeNode

/// 不同的二叉搜索树II
/// https://leetcode.cn/problems/unique-binary-search-trees-ii

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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        return build(1, n)
    }

    func build(_ lo: Int, _ hi: Int) -> [TreeNode?] {
        var res = [TreeNode?]()
        if lo > hi {
            res.append(nil)
            return res
        }
        for i in lo ... hi {
            let leftTrees = build(lo, i - 1)
            let rightTrees = build(i + 1, hi)
            for leftTree in leftTrees {
                for rightTree in rightTrees {
                    let root = TreeNode(i)
                    root.left = leftTree
                    root.right = rightTree
                    res.append(root)
                }
            }
        }
        return res
    }

    var result = [Int?]()

    func inorderTraversal(_ root: TreeNode?) -> [Int?] {
        traverse(root)
        return result
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else {
            result.append(nil)
            return
        }
        result.append(root.val)
        traverse(root.left)
        traverse(root.right)
    }
}

let root = Solution().generateTrees(3)

print(root.map { Solution().inorderTraversal($0) })
