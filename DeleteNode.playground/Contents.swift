import Foundation

// MARK: - ListNode

/// 删除链表中的节点
/// https://leetcode.cn/problems/delete-node-in-a-linked-list

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// MARK: - Solution

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let node = node else {
            return
        }
        guard let next = node.next else {
            return
        }
        node.val = next.val
        node.next = next.next
    }
}
