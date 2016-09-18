//
//  58_LengthOfLastWord.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-08-27.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:58 Length of Last Word
	URL: https://leetcode.com/problems/length-of-last-word/
	Space: O(n)
	Time: O(n)
 */

class LengthOfLastWord_Solution {
  func lengthOfLastWord(_ s: String) -> Int {
    if let lastWord = s.characters.split(separator: " ").last {
      return lastWord.count
    } else {
      return 0
    }
  }
}
