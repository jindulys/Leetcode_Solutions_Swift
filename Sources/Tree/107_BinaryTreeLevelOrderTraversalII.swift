//
//  107_BinaryTreeLevelOrderTraversalII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:107 Binary Tree Level Order Traversal II
	URL: https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
	Space: O(N)
	Time: O(N)
 */

class BinaryTreeLevelOrderTraversalII_Solution {
  func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard let validRoot = root else {
      return []
    }
    var traversalQueue = Queue<(TreeNode, Int)>()
    var result: [[Int]] = []
    var lastLevel = 0
    var currentLevelNodes: [Int] = []
    traversalQueue.enqueue((validRoot, 0))
    while !traversalQueue.isEmpty() {
      let (currentTreeNode, currentLevel) = traversalQueue.dequeue()!
      if let leftTreeNode = currentTreeNode.left {
        traversalQueue.enqueue((leftTreeNode, currentLevel + 1))
      }
      if let rightTreeNode = currentTreeNode.right {
        traversalQueue.enqueue((rightTreeNode, currentLevel + 1))
      }
      if currentLevel == lastLevel {
        currentLevelNodes.append(currentTreeNode.val)
      } else {
        result.insert(currentLevelNodes, at: 0)
        currentLevelNodes = [currentTreeNode.val]
        lastLevel = currentLevel
      }
    }
    if currentLevelNodes.count > 0 {
      result.insert(currentLevelNodes, at: 0)
    }
    return result
  }
  
  func test() {
    let root = TreeNode(3)
    let l1 = TreeNode(9)
    let r1 = TreeNode(20)
    let l2 = TreeNode(15)
    let r2 = TreeNode(7)
    root.left = l1
    root.right = r1
    r1.left = l2
    r1.right = r2
    let result = self.levelOrderBottom(root)
    print(result)
  }
}
