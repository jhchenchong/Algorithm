import Foundation

// MARK: - ListNode

/// 反转链表
/// https://leetcode.cn/problems/reverse-linked-list
class ListNode {
    var val: Int
    var next: ListNode?
    init() {
        self.val = 0
        self.next = nil
    }

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

// MARK: - Solution

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head,
              let next = head.next
        else {
            return head
        }
        let newHead = reverseList(next)
        next.next = head
        head.next = nil
        return newHead
    }

    func reverseList2(_ head: ListNode?) -> ListNode? {
        var input = head
        var newHead: ListNode?
        while input != nil {
            let tmp = input?.next
            input?.next = newHead
            newHead = input
            input = tmp
        }
        return newHead
    }
}
