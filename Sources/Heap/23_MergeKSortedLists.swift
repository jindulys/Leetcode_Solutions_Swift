//
//  23_MergeKSortedLists.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-09.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

class MergeKSortedLists_Solution {
  func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var listNodeHeap = Heap<ListNode> {
      $0.val < $1.val
    }
    for l in lists {
      if let validList = l {
        listNodeHeap.insert(validList)
      }
    }
    if listNodeHeap.isEmpty {
      return nil
    }
    let dummyNode = ListNode(0)
    var prev: ListNode? = dummyNode
    while let checkingNode = listNodeHeap.remove() {
      prev?.next = ListNode(checkingNode.val)
      prev = prev?.next
      if let validNext = checkingNode.next {
        listNodeHeap.insert(validNext)
      }
    }
    return dummyNode.next
  }
}
