//
//  347_TopKFrequentElements.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-21.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:347 Top K Frequent Element
	URL: https://leetcode.com/problems/top-k-frequent-elements/
	Space: O(klgk)
	Time: O(N)
 */

class TopKFrequentElements_Solution {
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var elementCounts = [Int : Int]()
    for i in nums {
      if let currentCount = elementCounts[i] {
        elementCounts[i] = currentCount + 1
      } else {
        elementCounts[i] = 1
      }
    }
    var keys = [Int](elementCounts.keys)
    keys.sort {
      let firstCount = elementCounts[$0]!
      let secondCount = elementCounts[$1]!
      return firstCount > secondCount
    }
    return Array(keys.prefix(upTo: k))
  }
}
