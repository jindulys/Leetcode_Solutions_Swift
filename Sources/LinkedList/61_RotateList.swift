//
//  61_RotateList.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-06.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:61 Rotate List
	URL: https://leetcode.com/problems/rotate-list/
	Space: O(1)
	Time: O(N)
 */

class RotateList_Solution {
  func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let validHead = head else {
      return nil
    }
    var totalCount = 1
    var currentNode = validHead
    while let nextNode = currentNode.next {
      totalCount += 1
      currentNode = nextNode
    }

    var needRotate = k % totalCount
    var prevNode: ListNode? = validHead
    var postNode: ListNode? = validHead

    while needRotate > 0 {
      postNode = postNode?.next
      needRotate -= 1
    }

    while postNode?.next != nil {
      postNode = postNode?.next
      prevNode = prevNode?.next
    }

    postNode?.next = head
    postNode = prevNode?.next
    prevNode?.next = nil
    return postNode
  }
}
