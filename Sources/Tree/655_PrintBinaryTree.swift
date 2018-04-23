//
//  655_PrintBinaryTree.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-22.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

import Foundation

/**
 Title: 655 Print Binary Tree
 URL: https://leetcode.com/problems/print-binary-tree
 Space: O(n)
 Time: O(n)
 */

class PrintBinaryTree {
  func printTree(_ root: TreeNode?) -> [[String]] {
    let (treeDepth, treeWidth) = findTreeDimension(root)
    var matrix =
        Array(repeatElement(Array(repeatElement("", count: treeWidth)), count: treeDepth))
    fillNode(root, 0, 0, treeWidth, &matrix)
    return matrix
  }

  private func fillNode(_ node: TreeNode?,
                        _ level: Int,
                        _ startIndex: Int,
                        _ endIndex: Int,
                        _ matrix: inout [[String]]) {
    guard let vNode = node else {
      return
    }
    let middleIndex = startIndex + (endIndex - startIndex) / 2
    matrix[level][middleIndex] = String(vNode.val)
    fillNode(vNode.left, level + 1, startIndex, middleIndex, &matrix)
    fillNode(vNode.right, level + 1, middleIndex + 1, endIndex, &matrix)
  }

  private func findTreeDimension(_ root: TreeNode?) -> (Int, Int) {
    guard let vRoot = root else {
      return (0, 0)
    }
    let (leftDepth, leftWidth) = findTreeDimension(vRoot.left)
    let (rightDepth, rightWidth) = findTreeDimension(vRoot.right)
    let childDepth = max(leftDepth, rightDepth)
    let childWidth = max(leftWidth, rightWidth)
    return (childDepth + 1, childWidth * 2 + 1)
  }
}
