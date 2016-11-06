//
//  83_RemoveDuplicatesFromSortedList.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:83 Remove Duplicates From Sorted List
	URL: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
	Space: O(1)
	Time: O(N)
 */

class RemoveDuplicatesFromSortedList_Solution {
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard var validHead = head else {
      return nil
    }
    var checkingNode: ListNode? = ListNode(validHead.val)
    let result = checkingNode
    while let validNext = validHead.next {
      validHead = validNext
      if let val = checkingNode?.val, val == validNext.val {
        continue
      }
      checkingNode?.next = ListNode(validNext.val)
      checkingNode = checkingNode?.next
    }
    return result
  }
  
  func deleteDuplicatesInPlaceSolution(_ head: ListNode?) -> ListNode? {
    guard var validHead = head else {
      return nil
    }
    var checkingNode: ListNode = validHead
    while let validNext = validHead.next {
      validHead = validNext
      if validNext.val == checkingNode.val {
        continue
      }
      checkingNode.next = validNext
      checkingNode = validNext
    }
    // NOTE: set checing Node next to nil to get rid of those stale data when there
    // are no new data come in for the last few items.
    checkingNode.next = nil
    return head
  }
}
