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
}