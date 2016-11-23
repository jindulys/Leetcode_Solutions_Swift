//
//  56_MergeIntervals.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-21.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

class MergeIntervals_Solution {
  /// Primary idea use binary search.
  func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else {
      return []
    }
    var merged = [intervals[0]]
    for i in 1..<intervals.count {
      // TODO: merge in current intervals
      let currentInsertPos = binarySearchInterval(intervals[i], array: merged)
      if currentInsertPos == merged.count {
        let currentLast = merged[merged.count - 1]
        if currentLast.end < intervals[i].start {
          merged.append(intervals[i])
        } else {
          merged.removeLast()
          merged.append(Interval(currentLast.start, max(intervals[i].end, currentLast.end)))
        }
      } else {
        let oldElement = merged[currentInsertPos]
        if currentInsertPos == 0 {
          if intervals[i].end < oldElement.start {
            merged.insert(intervals[i], at: 0)
          } else {
            merged[0] = Interval(intervals[i].start, max(intervals[i].end, oldElement.end))
          }
        } else {
          let oldBeforeElement = merged[currentInsertPos - 1]
          if intervals[i].end < oldElement.start {
            if intervals[i].start > oldBeforeElement.end {
              merged.insert(intervals[i], at: currentInsertPos)
            } else {
              merged[currentInsertPos - 1] = Interval(oldBeforeElement.start, max(intervals[i].end, oldBeforeElement.end))
            }
          } else {
            let potentialNewInterval = Interval(intervals[i].start, max(intervals[i].end, oldBeforeElement.end))
            merged[currentInsertPos] = potentialNewInterval
            if potentialNewInterval.start <= oldBeforeElement.end {
              merged.remove(at:currentInsertPos)
              merged[currentInsertPos - 1] = Interval(oldBeforeElement.start, max(oldBeforeElement.end, potentialNewInterval.end))
            }
          }
        }
      }
    }
    return merged
  }
  
  /// return insert position.
  func binarySearchInterval(_ interval: Interval, array: [Interval]) -> Int {
    guard array.count > 1 else {
      if array[0].start >= interval.start {
        return 0
      } else {
        return 1
      }
    }
    var start = 0
    var end = array.count - 1
    while end > start + 1 {
      let mid = start + (end - start) / 2
      if array[mid].start <= interval.start {
        start = mid
      } else {
        end = mid
      }
    }
    if interval.start <= array[start].start {
      return start
    } else if interval.start <= array[end].start {
      return end
    } else {
      return end + 1
    }
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
