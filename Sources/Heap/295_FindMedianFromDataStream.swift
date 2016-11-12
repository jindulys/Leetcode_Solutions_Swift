//
//  295_FindMedianFromDataStream.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-10.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

public protocol NumberProtocol {
  static func +(left: Self, right: Self) -> Self
  static func -(left: Self, right: Self) -> Self
  static func *(left: Self, right: Self) -> Self
  static func /(left: Self, right: Self) -> Self
  static func /(left: Self, right: Int) -> Self
}

extension Int : NumberProtocol {}

/// A data structure that could find median quite quick, O(1).
// NOTE: Features this struct have
//      1. Generic.
//      2. Multiple Protocols Constraints.
//      3. Operator overload protocol.
//      4. NumberProtocol `Self`.
//      5. Heap.

/**
	Title:295 Find Median From Data Stream
	URL: https://leetcode.com/problems/find-median-from-data-stream/
	Space: O(N)
	Time: O(1) || O(lgN)
 */

public struct QuickMedian<T: Comparable & NumberProtocol> {
  
  // smallerHalf is a min heap stored the smaller half used maxHeap.
  fileprivate var smallerHalf: Heap<T> = Heap {
    $0 > $1
  }

  // largerHalf is a max heap stored the larger half used minHeap.
  fileprivate var largerHalf: Heap<T> = Heap {
    $0 < $1
  }
  
  /// Add a new element to this structure.
  public mutating func add(_ newOne: T) {
    assert(abs(smallerHalf.count - largerHalf.count) < 2)
    if smallerHalf.count > largerHalf.count, let smallerPeak = smallerHalf.peak() {
      if smallerPeak > newOne {
        smallerHalf.remove()
        smallerHalf.insert(newOne)
        largerHalf.insert(smallerPeak)
      } else {
        largerHalf.insert(newOne)
      }
    } else if largerHalf.count > smallerHalf.count, let largerPeak = largerHalf.peak() {
      if largerPeak < newOne {
        smallerHalf.insert(largerPeak)
        largerHalf.remove()
        largerHalf.insert(newOne)
      } else {
        smallerHalf.insert(newOne)
      }
    } else if let rightPeak = largerHalf.peak() {
      if newOne > rightPeak {
        largerHalf.insert(newOne)
      } else {
        smallerHalf.insert(newOne)
      }
    } else {
      smallerHalf.insert(newOne)
    }
  }

  /// Pop the median, if empty return nil.
  public func popMedian() -> T? {
    if self.isEmpty {
      return nil
    }
    if smallerHalf.count > largerHalf.count {
      return smallerHalf.peak()
    }
    if smallerHalf.count < largerHalf.count {
      return largerHalf.peak()
    }
    return (smallerHalf.peak()! + largerHalf.peak()!) / 2
  }

  /// Whether or not this struct contains something.
  public var isEmpty: Bool {
    get {
      return smallerHalf.isEmpty && largerHalf.isEmpty
    }
  }
}
