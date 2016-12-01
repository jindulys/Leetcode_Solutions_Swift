//
//  346_MovingAverage.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-30.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:346 Moving Average from Data Stream
	URL: https://leetcode.com/problems/moving-average-from-data-stream/
	Space: O(1)
	Time: O(N)
 */

class MovingAverage_Solution {
  // The size for this moving average.
  let size: Int
  
  // The queue to use.
  var queue: Queue<Int>
  
  var previousSum: Int
  
  init(size: Int) {
    self.size = size
    queue = Queue<Int>()
    previousSum = 0
  }
  
  // Provide a next value to this object then return the average value for this object.
  func next(_ next: Int) -> Int {
    var change: Int = 0
    if queue.size < self.size {
      queue.enqueue(next)
      previousSum += next
    } else {
      let previous = queue.dequeue()!
      queue.enqueue(next)
      change = next - previous
    }
    previousSum = previousSum + change
    return previousSum / (queue.size < self.size ? queue.size : self.size)
  }
  
  class func test() {
    let testMoving = MovingAverage_Solution(size: 3)
    let r1 = testMoving.next(1)
    let r2 = testMoving.next(10)
    let r3 = testMoving.next(3)
    let r4 = testMoving.next(5)
    if r1 == 1 && r2 == 5 && r3 == 4 && r4 == 6 {
      print("Pass")
    } else {
      print("Not pass")
    }
  }
}
