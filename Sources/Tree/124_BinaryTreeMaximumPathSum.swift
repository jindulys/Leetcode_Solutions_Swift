//
//  124_BinaryTreeMaximumPathSum.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:124 Binary Tree Maximum Path Sum
	URL: https://leetcode.com/problems/binary-tree-maximum-path-sum/
	Space: O(n)
	Time: O(n^2)
 */

class BinaryTreeMaximumPathSum_Solution {
  func maxPathSum(root: TreeNode?) -> Int {
    let (_, anyMax) = maxPathSumHelper(root)
    return anyMax
  }
  
  private func maxPathSumHelper(root: TreeNode?) -> (Int, Int) {
    guard let root = root else {
      return (0, Int.min)
    }
    let (leftRootMax, leftAnyMax) = maxPathSumHelper(root.left)
    let (rightRootMax, rightAnyMax) = maxPathSumHelper(root.right)
    var currentRootMax = max(leftRootMax, rightRootMax) + root.val
    currentRootMax = max(currentRootMax, 0)
    var currentAnyMax = max(leftAnyMax, rightAnyMax)
    currentAnyMax = max(currentAnyMax, leftRootMax + rightRootMax + root.val)
    return (currentRootMax, currentAnyMax)
  }
  
  func maxPathSum_Memoized(root: TreeNode?) -> Int {
    let hashableTreeRoot = HashableTreeNode.buildHashableTreeWith(root)
    let (_, anyMax) = maxPathSumMemoized(hashableTreeRoot)
    return anyMax
  }
  
  private func maxPathSumMemoized(root: HashableTreeNode?) -> (Int, Int) {
    guard let root = root else {
      return (0, Int.min)
    }
    let ans:(HashableTreeNode) -> (Int, Int) = memoize { (ans: HashableTreeNode -> (Int, Int), currentNode: HashableTreeNode) -> (Int, Int) in
      var leftResult: (Int, Int)
      if let left = currentNode.left {
        leftResult = ans(left)
      } else {
        leftResult = (0, Int.min)
      }
      var rightResult: (Int, Int)
      if let right = currentNode.right {
        rightResult = ans(right)
      } else {
        rightResult = (0, Int.min)
      }
      var currentRootMax = max(leftResult.0, rightResult.0) + currentNode.val
      currentRootMax = max(currentRootMax, 0)
      var currentAnyMax = max(leftResult.1, rightResult.1)
      currentAnyMax = max(currentAnyMax, leftResult.0 + rightResult.0 + currentNode.val)
      return (currentRootMax, currentAnyMax)
    }
    return ans(root)
  }
  
  
  func test() {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    node1.left = node2
    node1.right = node3
    let result = maxPathSum(node1)
    if result == 6 {
      print("Pass")
    } else {
      print("Fail")
    }
  }
}