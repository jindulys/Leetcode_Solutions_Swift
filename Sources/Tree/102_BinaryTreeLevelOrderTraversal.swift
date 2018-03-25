//
//  102_BinaryTreeLevelOrderTraversal.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-04.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
  Swift Knowledge:
 
  Queue, Array
 
  Algorithem Knowledge:
 
  BFS
 */

/**
  102. Binary Tree Level Order Traversal
  https://leetcode.com/problems/binary-tree-level-order-traversal/
 */

class BinaryTreeLevelOrderTraversal_Solution {
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let node = root else {
        return []
    }
    var result: [[Int]] = []
    var queue = Queue<(TreeNode, Int)>()
    queue.enqueue((node, 0))
    while !queue.isEmpty() {
        let (currentNode, currentLevel) = queue.dequeue()!
        if currentLevel >= result.count {
            result.append([])
        }
        result[currentLevel].append(currentNode.val)
        if let left = currentNode.left {
            queue.enqueue((left, currentLevel + 1))
        }
        if let right = currentNode.right {
            queue.enqueue((right, currentLevel + 1))
        }
    }
    return result
  }
}
