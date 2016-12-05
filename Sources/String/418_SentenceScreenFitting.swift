//
//  418_SentenceScreenFitting.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-04.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:418 Sentence Screen Fitting
	URL: https://leetcode.com/problems/sentence-screen-fitting/
	Space: O(1)
	Time: O(row * col)
 */

class SentenceScreenFitting_Solution {
  func wordsTyping(_ sentence: [String], _ rows: Int, _ cols: Int) -> Int {
    guard sentence.count > 0 && rows > 0 && cols > 0 else {
      return 0
    }
    var formattedSentence = sentence.joined(separator: " ")
    formattedSentence += " "
    let characters = Array(formattedSentence.characters)
    var start = 0
    for _ in 0..<rows {
      start += cols
      if characters[start % characters.count] == " " {
        start += 1
      }else {
        // NOTE: we use mod to make sure we won't out of index.
        // start > 0 in case col is small and stop when start = 0
        while start > 0 && characters[(start - 1) % characters.count] != " " {
          start -= 1
        }
      }
    }
    return start / characters.count
  }
  
  func test() {
    let sentence = ["hello"]
    let result = wordsTyping(sentence, 10, 1)
    print(result)
  }
}
