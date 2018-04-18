//
//  437_PathSumIII.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-17.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 437 Path Sum III
 URL: https://leetcode.com/problems/path-sum-iii/description/
 Space: O(n)
 Time: O(n)
 */
class PathSumIII {
  func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    guard  let vRoot = root else {
      return 0
    }
    return pathSumInclude(_:vRoot, _:sum) + pathSum(_:vRoot.left, _:sum) + pathSum(_:vRoot.right, _:sum)
  }

  func pathSumInclude(_ root: TreeNode?, _ target: Int) -> Int {
    guard let validRoot = root else {
      return 0
    }
    var currentResult: Int = 0
    if validRoot.val == target {
      currentResult += 1
    }
    currentResult += pathSumInclude(_:validRoot.left, _: target - validRoot.val)
    currentResult += pathSumInclude(_:validRoot.right, _: target - validRoot.val)
    return currentResult
  }
}
