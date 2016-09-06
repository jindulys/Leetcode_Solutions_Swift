//
//  ViewController.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-07.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let solution = LongestCommonPrefix_Solution()
    let result = solution.longestCommonPrefix([])
    print(result)
    let twoSum = TwoSum_Solution()
    let twoSum_result = twoSum.twoSum([0, 4 , 3, 0], 0)
    print(twoSum_result)
    let rotateArray = RotateArray_Solution()
    rotateArray.test()
    let valid = ValidSudoku_Solution()
    let array1: [Character] = Array(".87654321".characters)
    let array2: [Character] = Array("2........".characters)
    let array3: [Character] = Array("3........".characters)
    let array4: [Character] = Array("4........".characters)
    let array5: [Character] = Array("5........".characters)
    let array6: [Character] = Array("6........".characters)
    let array7: [Character] = Array("7........".characters)
    let array8: [Character] = Array("8........".characters)
    let array9: [Character] = Array("9........".characters)
    valid.isValidSudoku([array1, array2, array3, array4, array5, array6, array7, array8, array9])
    let searchInRotatedArray = SearchInRotatedSortedArrayII_Solution()
    searchInRotatedArray.test()
    let mySqrt = Sqrt_Solution()
    mySqrt.test()
    
    let testTreeNode = TreeNode(10)
    let testLeft = TreeNode(6)
    let testRight = TreeNode(19)
    testTreeNode.left = testLeft
    testTreeNode.right = testRight
    let testLeftLeft = TreeNode(1)
    let testLeftRight = TreeNode(9)
    testLeft.left = testLeftLeft
    testLeft.right = testLeftRight
    let testRightLeft = TreeNode(12)
    let testRightRight = TreeNode(29)
    testRight.left = testRightLeft
    testRight.right = testRightRight
    
    let LCA = LowestCommonAncestorOfABinarySearchTree_Solution()
    LCA.test()
    
    let treeSum = BinaryTreeMaximumPathSum_Solution()
    treeSum.test()
    
    let compareVersion = CompareVersionNumbers_Solution()
    compareVersion.test()
    
    let firstBadVersion = FirstBadVersion_Solution()
    firstBadVersion.test()
    
    let findTheDifference = FindTheDifference_Solution()
    findTheDifference.test()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

