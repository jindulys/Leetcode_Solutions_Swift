//
//  326_PowerOfThree.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-05.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:326 Power of Three
	URL: https://leetcode.com/problems/power-of-three/
	Space: O(1)
	Time: O(1)
 */

class PowerOfThree_Solution {
  
  func isPowerOfThree(_ n: Int) -> Bool {
    guard n > 0 else {
      return false
    }
    return 3486784401 % n == 0
  }
}
