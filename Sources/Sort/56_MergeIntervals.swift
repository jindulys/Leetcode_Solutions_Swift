//
//  56_MergeIntervals.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-21.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:56 Merge Intervals
	URL: https://leetcode.com/problems/merge-intervals/
	Space: O(NlgN)
	Time: O(N)
 */

class MergeIntervals_Solution {
  /// Primary idea use binary search.
  func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else {
      return []
    }
    let sortedIntervals = intervals.sorted {
      if $0.start == $1.start {
        return $0.end <= $1.end
      }
      return $0.start < $1.start
    }
    var merged = [sortedIntervals[0]]
    for i in 1..<sortedIntervals.count {
      let currentLast = merged.last!
      if currentLast.end < sortedIntervals[i].start {
        merged.append(sortedIntervals[i])
      } else {
        merged[merged.count - 1] = Interval(currentLast.start, max(currentLast.end, sortedIntervals[i].end))
      }
    }
    return merged
  }
  
  func test() {
    let i1 = Interval(2,3)
    let i2 = Interval(4,5)
    let i3 = Interval(6,7)
    let i4 = Interval(8,9)
    let i5 = Interval(1,10)
    let intervals = [i1, i2, i3, i4, i5]
    let result = merge(intervals)
    print(result)
  }
}

public class Interval {
  public var start: Int
  public var end: Int
  public init(_ start: Int, _ end: Int) {
    self.start = start
    self.end = end
  }
}
