//
//  621_TaskScheduler.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-20.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

import Foundation

/**
 Title:361 Bomb Enemy
 URL: https://leetcode.com/problems/task-scheduler/
 Space: O(1)
 Time: O(N)
 */

class TaskScheduler {
  func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var characterCounts: [Int] = Array(repeatElement(0, count: 26))
    var maxCount: Int = 0
    var maxAppearance: Int = 0
    for cha in tasks {
      let currentIndex = cha.unicodeScalarCodePoint() - "A".unicodeScalarCodePoint()
      let currentCount = characterCounts[currentIndex]
      characterCounts[currentIndex] = currentCount + 1
      if characterCounts[currentIndex] > maxCount {
        maxCount = characterCounts[currentIndex]
        maxAppearance = 1
      } else if characterCounts[currentIndex] == maxCount {
        maxAppearance += 1
      }
    }
    let taskCount = tasks.count
    let occupiedCount = maxCount * maxAppearance
    let emptySpotsCount = (maxCount - 1) * (n + 1 - maxAppearance)
    let idleCounts = max(0, emptySpotsCount - (taskCount - occupiedCount))
    return taskCount + idleCounts
  }
}

extension String {
  func unicodeScalarCodePoint() -> Int {
    let scalars = self.unicodeScalars
    return Int(scalars[scalars.startIndex].value)
  }
}
