//
//  LeetCodeKit.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-04.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


// MARK: TreeNode

open class TreeNode {
  open var val: Int
  open var left: TreeNode?
  open var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

extension TreeNode: CustomStringConvertible {
  public var description: String {
    let currentLevelDescription = "|__\(val)\n"
    var leftDescription: String = ""
    if let left = self.left {
      let currentLeftDescription = left.description
      currentLeftDescription.characters.split(separator: "\n").forEach{
        leftDescription += "   " + String($0) + "\n"
      }
    } else {
      leftDescription = "   |_(NULL)\n"
    }
    var rightDescription: String = ""
    if let right = self.right {
      let currentRightDescription = right.description
      currentRightDescription.characters.split(separator: "\n").forEach{
        rightDescription += "   " + String($0) + "\n"
      }
    } else {
      rightDescription = "   |_(NULL)\n"
    }
    var finalLeft: String = ""
    for (index, element) in leftDescription.characters.split(separator: "\n").enumerated() {
      if index == 0 {
        finalLeft += String(element) + "\n"
      } else {
        var processingCharacters = element
        processingCharacters.removeFirst()
        var processingString = String(processingCharacters)
        processingString.insert("|", at: processingString.characters.index(processingString.startIndex, offsetBy: 3))
        finalLeft += processingString + "\n"
      }
    }
    return currentLevelDescription + finalLeft + rightDescription
  }
}

/// HashableTreeNode is a wrapper around TreeNode, to facilitate Hash.
open class HashableTreeNode {
  open var val: Int
  open var left: HashableTreeNode?
  open var right: HashableTreeNode?
  open var id: Int
  
  public init(val: Int, id: Int) {
    self.val = val
    self.id = id
  }
  
  /// Helper function to build a HashableTreeNode with TreeNode.
  open class func buildHashableTreeWith(_ root: TreeNode?, id: Int = 0) -> HashableTreeNode? {
    guard let root = root else {
      return nil
    }
    let hashableRoot = HashableTreeNode(val: root.val, id: id)
    let leftHashableRoot = self.buildHashableTreeWith(root.left, id: id * 2 + 1)
    let rightHashableRoot = self.buildHashableTreeWith(root.right, id: id * 2 + 2)
    hashableRoot.left = leftHashableRoot
    hashableRoot.right = rightHashableRoot
    return hashableRoot
  }
}

extension HashableTreeNode: Hashable {
  public var hashValue: Int {
    return self.id
  }
}

public func ==(lhs: HashableTreeNode, rhs: HashableTreeNode) -> Bool {
  return lhs.hashValue == rhs.hashValue
}

// MARK: Tool Functions

/**
 A helper function which takes in a block execute, print out executionTime
 
 - parameter executedBlock: block to be executed
 
 - returns: execution time
 */
public func logRunTime(_ executedBlock: ()->()) -> TimeInterval {
  let startDate = Date()
  executedBlock()
  let endDate = Date()
  let executionTime = endDate.timeIntervalSince(startDate)
  print("ExecutionTime = \(executionTime)")
  return executionTime
}

/**
 Get all primes up to length
 
 - parameter length: the upper boundary for primes
 - returns : an array of all primes in that range
 */
public func getBetterPrimes(_ length:Int) -> [Int] {
  // Here the length means how many elements we have
  // This prime finder is a specific one because we want to find gap that is prime
  // so we start from 3
  var primes = [Int]()
  if length < 3 {
    return primes
  }
  
  // here since we want to find gap, length should not be included, start from 2 since 2 is the smallest prime
  for i in 2...length {
    var currentIsPrime = true
    // check prime is general, we should use count from 2 to sqrt(i) to see whether or not it
    // could be divided.
    let higherBounder = sqrt(Double(i))
    let intHigher = Int(higherBounder)
    if intHigher >= 2 {
      for j in 2...intHigher {
        if i % j == 0 {
          currentIsPrime = false
          break
        }
      }
    }
    
    if currentIsPrime {
      primes.append(i)
    }
  }
  return primes
}

/**
 
 This method return the num of elements that less than or equal to target
 e.g. [2, 3, 5] input 5, will return 3 means there are 3 elements less than or equal to 5
 
 - parameter inputs: array that to be processed
 - target: target to be found
 
 */

public func binarySearchLessOrEqualIndex(_ inputs:[Int], target:Int) -> Int {
  var lowerIndex = 0
  var higherIndex = inputs.count - 1
  
  var indexToCheck = (higherIndex + lowerIndex) / 2
  while lowerIndex <= higherIndex {
    if inputs[indexToCheck] == target {
      return indexToCheck + 1
    } else if (inputs[indexToCheck] < target) {
      lowerIndex = indexToCheck + 1
      indexToCheck = (higherIndex + lowerIndex) / 2
    } else {
      higherIndex = indexToCheck - 1
      indexToCheck = (higherIndex + lowerIndex) / 2
    }
  }
  
  // At this point our lower exceed higher
  return higherIndex + 1
}

// TODO: Binary Search (1)
// https://github.com/hollance/swift-algorithm-club/tree/master/Binary%20Search

/**
 Recursive version of binarySearch
 
 - parameter a:     array to do the search should be sorted
 - parameter key:   key to find
 - parameter range: range to find
 
 - returns: finded index or not
 */
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
  precondition(a.adjacentTest{ $0 <= $1 }, "The array should be ordered to use binary search")
  if range.lowerBound >= range.upperBound {
    // Base Case
    return nil
  }
  
  let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
  if a[midIndex] > key {
    // Check left part of array
    return binarySearch(a, key: key, range: range.lowerBound..<midIndex)
  } else if a[midIndex] < key {
    // Check right part of array
    return binarySearch(a, key: key, range: midIndex+1..<range.upperBound)
  } else {
    return midIndex
  }
}

/**
 Iterative version of binarySearch
 
 - parameter a:     array to do the search should be sorted
 - parameter key:   key to find
 - parameter range: range to find
 
 - returns: finded index or not
 */
func iterativeBinarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
  precondition(a.adjacentTest{ $0 <= $1 }, "The array should be ordered to use binary search")
  var range = 0..<a.count
  while range.lowerBound < range.upperBound {
    let mid = range.lowerBound + (range.upperBound - range.lowerBound)/2
    var lowerBound: Int = range.lowerBound
    var upperBound: Int = range.upperBound
    if a[mid] == key {
      return mid
    } else if a[mid] < key {
      lowerBound = mid+1
    } else {
      upperBound = mid
    }
    range = lowerBound..<upperBound

  }
  return nil
}

// TODO: Merge Sort (2)
public func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array }
  
  let mid = array.count/2
  
  let leftArray = mergeSort(Array(array[0..<mid]))
  let rightArray = mergeSort(Array(array[mid..<array.count]))
  
  return merge(leftPile: leftArray, rightPile: rightArray)
}

/**
 Merge two piles together
 
 - parameter leftPile:  Left pile to be merged
 - parameter rightPile: right pile to be merged
 
 - returns: merged pile
 */
private func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
  precondition(leftPile.count>=1 && rightPile.count>=1)
  precondition(leftPile.isIncreasing && rightPile.isIncreasing)
  var leftIndex = 0
  var rightIndex = 0
  
  var retVal = [T]()
  while leftIndex < leftPile.endIndex && rightIndex < rightPile.endIndex {
    if leftPile[leftIndex] < rightPile[rightIndex] {
      retVal.append(leftPile[leftIndex])
      leftIndex = (leftIndex + 1)
    } else if leftPile[leftIndex] > rightPile[rightIndex] {
      retVal.append(rightPile[rightIndex])
      rightIndex = (rightIndex + 1)
    } else {
      retVal.append(leftPile[leftIndex])
      retVal.append(rightPile[rightIndex])
      leftIndex = (leftIndex + 1)
      rightIndex = (rightIndex + 1)
    }
  }
  
  while leftIndex < leftPile.endIndex {
    retVal.append(leftPile[leftIndex])
    leftIndex = (leftIndex + 1)
  }
  
  while rightIndex < rightPile.endIndex {
    retVal.append(rightPile[rightIndex])
    rightIndex = (rightIndex + 1)
  }
  
  return retVal
}

// TODO: Binary Tree (3)

// TODO: Binary Search Tree(BST) (4)

// TODO: Array2D (5)
// Reference: https://github.com/hollance/swift-algorithm-club/tree/master/Array2D
public struct Array2D<T> {
  public let columns: Int
  public let rows: Int
  fileprivate var array: [T]
  
  public init(rows: Int, columns: Int, initialValue: T) {
    self.columns = columns
    self.rows = rows
    array = Array(repeating: initialValue, count: self.rows * self.columns)
  }
  
  public subscript(row: Int, col:Int) -> T {
    get {
      precondition(row < self.rows, "Row overbound")
      precondition(col < self.columns, "Col overbound")
      return array[row * self.columns + col]
    }
    set {
      precondition(row < self.rows, "Row overbound")
      precondition(col < self.columns, "Col overbound")
      array[row * self.columns + col] = newValue
    }
  }
}

// TODO: k-th Largest Element (6)
// Refer to: https://github.com/hollance/swift-algorithm-club/tree/master/Kth%20Largest%20Element
// This implementation is awesome
//public func randomizedSelect<T: Comparable>(array: [T], order k: Int) -> T {
//
//}

// TODO: Count Occurrences (7)

// TODO: Boyer-Moore String Search (9)

// TODO: Hash Table (10)



/**
 *  give an array find the smallest element's index that is larger or equal to key
 *
 *  - parameter inputs: array to be operated on
 *  - parameter l:      left boundary
 *  - parameter r:      right boundary
 *  - parameter key:    target to be found
 */
public func ceilIndex<T: Comparable>(_ inputs:[T], l: Int, r: Int, key: T) -> Int {
  var localL = l
  var localR = r
  var m = 0
  while localR - localL > 1 {
    m = localL + (localR - localL)/2
    if inputs[m] >= key {
      localR = m
    } else {
      localL = m
    }
  }
  return localR
}

//MARK: MEMOIZATION
/**
 Swift implementation of memoization
 
 - parameter body: a closure with itself type and input, who's input want to be memorized
 
 - returns: a closure who's input has already in a memorized way
 */
public func memoize<T: Hashable, U>( _ body:@escaping ((T)->U, T)->U ) -> (T)->U {
  var memo = Dictionary<T, U>()
  var result: ((T)->U)!
  result = { x in
    if let q = memo[x] { return q }
    let r = body(result, x)
    memo[x] = r
    return r
  }
  return result
}

/**
 QuickSortSlow a slow version of quick sort since it uses a bunch of filter, copy.
 
 - parameter array: array to be sorted
 
 - returns: new array that was sorted
 */
public func quickSortSlow<T: Comparable>(_ array: [T]) -> [T] {
  if array.count <= 1 {
    return array
  }
  let pivot = array[array.count/2]
  let less = array.filter { $0 < pivot }
  let equal = array.filter { $0 == pivot }
  let greater = array.filter { $0 > pivot }
  return quickSortSlow(less) + equal + quickSortSlow(greater)
}

/**
 Partition technology could enhance the efficiency of sorting. Because it could reduce the walk through process, and copy, but lomuto is not good if there are a lot of duplicated elements.
 
 - parameter array: array to be sourted, this array could be sorted in place
 
 - parameter low: lower bound index for the array
 
 - parameter high: higher bound index for the array
 */

public func quickSortLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
  if (low < high) {
    let p = partitionLomuto(&array, low: low, high: high)
    quickSortLomuto(&array, low: low, high: p-1)
    quickSortLomuto(&array, low: p+1, high: high)
  }
}

// ASCII art
// [ values <= pivot | values > pivot | not looked at yet | pivot ]
//  low          i       i+1     j-1    j          high-1    high
private func partitionLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
  let pivot = array[high]
  var i = low
  for j in low..<high {
    if array[j] <= pivot {
      // swap array[i],array[j] to keep ASCII art
      (array[j], array[i]) = (array[i], array[j])
      i += 1
    }
  }
  // final swap i and high
  (array[i], array[high]) = (array[high], array[i])
  return i
}

public func quicksort<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
  if low < high {
    let p = partitionHoare(&array, low: low, high: high)
    quicksort(&array, low: low, high: p)
    quicksort(&array, low: p+1, high: high)
  }
}

private func partitionHoare<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
  let pivot = array[low]
  var i = low-1
  var j = high+1
  
  while true {
    repeat { j -= 1 } while array[j] > pivot
    repeat { i += 1 } while array[i] < pivot
    if (i < j) {
      (array[i], array[j]) = (array[j], array[i])
    } else {
      return j
    }
  }
}

// MARK: Helper Functions

func *(left: String, right: Int) -> String {
  if right < 0 {
    return ""
  }
  
  var retVal = ""
  for _ in 0..<right {
    retVal += left
  }
  return retVal
}


// MARK: extensions

/**
 Extension: Character
 */
public extension Character {
  /**
   Convert a Character to unicodeScalar value
   e.g turn 'a' to 97
   */
  
  func unicodeScalarCodePoint() -> Int {
    let characterString = String(self)
    let scalars = characterString.unicodeScalars
    
    return Int(scalars[scalars.startIndex].value)
  }
}

public extension String.CharacterView {
  public var stringValue: String { return String(self) }
}

public extension Dictionary {
  
  //    /**
  //        Initialize Dictionary with SequenceTpye
  //     */
  //    init<S:SequenceType where S.Generator.Element == (Key, Value)>(_ sequence: S) {
  //        self = [:]
  //        self.merge(sequence)
  //    }
  //
  //    /**
  //     Merge Dictionary
  //
  //     Merge other to self, replace those values if key already exists.
  //     */
  //    mutating func merge<S: SequenceType where S.Generator.Element == (Key, Value)>(other: S) {
  //        for (k, v) in other {
  //            self[k] = v
  //        }
  //    }
}

public extension Array {
  /**
   AdjacentTest test whether every pair of adjacent elements fullfill the condition
   
   - parameter condition: condition to be tested by every adjacent pair
   
   - parameter oneElementArrayAllowed:
   
   - returns: true if every pair fullfill the condition, otherwise false
   */
  func adjacentTest(_ oneElementArrayAllowed: Bool = true, condition: (Element, Element) -> Bool) -> Bool {
    guard self.count > 1 else { return oneElementArrayAllowed }
    for i in 0..<self.count-1 {
      if condition(self[i], self[i+1]) == false {
        return false
      }
    }
    return true
  }
  
  func accumulate<T>(_ initial: T, combine:(Element, T)->T) -> [T] {
    var result = initial
    return self.map { toCombine in
      result = combine(toCombine, result)
      return result
    }
  }
  
  /**
   reduce function, take a combination function and combine all elements from the first one
   
   - parameter combine: combine function to combine all elements
   
   - returns: the result or nil if the array is empty
   */
  func reduce(_ combine:(Element, Element)->Element) -> Element? {
    guard let fst = first else { return nil }
    return self.dropFirst().reduce(fst, combine)
  }
  
  /**
   Remove first few elements that satisfy removing condition.
   
   - parameter removeCondition: condition to remove an element.
   */
  func removePreElementsSatisfy(_ removeCondition:(Element) -> Bool) -> [Element] {
    let count = self.count
    var leftStartIndex = 0
    for (i, e) in self.enumerated() {
      if !removeCondition(e) {
        break
      }
      leftStartIndex = i
    }
    return leftStartIndex+1<count ? Array(self[(leftStartIndex+1)..<count]) : []
  }
}

extension Array {
  /**
   reduce function, take a combination function and combine all elements from the first one
   
   - parameter combine: combine function to combine all elements
   
   - returns: the result or nil if the array is empty
   */
  func reduceByMap(_ combine:(Element, Element)->Element) -> Element? {
    return first.map {
      self.dropFirst().reduce($0, combine)
    }
  }
}

public extension Array where Element: Comparable {
  public var isIncreasing: Bool {
    return self.adjacentTest{ $0 <= $1 }
  }
  
  public var isStrictlyIncreasing: Bool {
    return self.adjacentTest { $0 < $1 }
  }
}

public extension Array where Element: Equatable {
  public func LCS(_ other: [Element]) -> [Element] {
    let table =
        MemoizedSequenceComparison.buildTable(self, other, self.count, other.count)
    return Array.lcsFromIndices(table, self, other, self.count, other.count)
  }
  
  fileprivate static func lcsFromIndices(_ table: [[Int]],
                                         _ x: [Element],
                                         _ y: [Element],
                                         _ i: Int,
                                         _ j: Int) -> [Element] {
    if i == 0 || j == 0 {
      return []
    } else if x[i - 1] == y[j - 1] {
      return lcsFromIndices(table, x, y, i - 1, j - 1) + [x[i - 1]]
    } else if table[i - 1][j] > table[i][j - 1] {
      return lcsFromIndices(table, x, y, i - 1, j)
    } else {
      return lcsFromIndices(table, x, y, i, j - 1)
    }
  }
}

internal struct MemoizedSequenceComparison<T: Equatable> {
  static func buildTable(_ x: [T], _ y: [T], _ n: Int, _ m: Int) -> [[Int]] {
    var table = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    for i in 0...n {
      for j in 0...m {
        if i == 0 || j == 0 {
          continue
        }
        if x[i - 1] == y[j - 1] {
          table[i][j] = table[i - 1][j - 1] + 1
        } else {
          table[i][j] = max(table[i][j - 1], table[i - 1][j])
        }
      }
    }
    return table
  }
}

public extension Sequence where Iterator.Element: Hashable {
  /**
   Given a sequence of array returns unique element
   */
  func unique() -> [Iterator.Element] {
    var seen: Set<Iterator.Element> = []
    return filter {
      if seen.contains($0) {
        return false
      } else {
        seen.insert($0)
        return true
      }
    }
  }
}

public extension Sequence {
  public func allMatch(_ predicate: (Iterator.Element) -> Bool) -> Bool {
    return !self.contains { !predicate($0) }
  }
}

extension Sequence where Iterator.Element: Equatable {
  func subtract(_ toRemove: [Iterator.Element]) -> [Iterator.Element] {
    return self.filter {
      !toRemove.contains($0)
    }
  }
}

// TODO(simonli): Need further investigation.
//extension Sequence {
//  func subtract<S: Sequence>
//    (_ toRemove: S,
//    predicator:@escaping (Iterator.Element, Any) -> Bool) -> [Iterator.Element] {
//    return self.filter { sourceElement in
//      toRemove.contains { removeElement in
//        //predicator($0, sourceElement)
//        return false
//      }
//    }
//  }
//}

public extension String {
  /**
   Check whether this string contains all the English Characters, this method treat upper case and lower case the same
   
   - returns: whether or not contains all the english characters
   */
  func containsAllEnglishCharacters() -> Bool {
    guard self.characters.count >= 26 else { return false }
    var englishCharacters: Set<Int> = []
    let a : Character = "a"
    for c in self.characters {
      let lowerCs = String(c).lowercased().characters
      let lowerC = lowerCs[lowerCs.startIndex]
      let index = lowerC.unicodeScalarCodePoint() - a.unicodeScalarCodePoint()
      switch index {
      case 0..<26:
        if !englishCharacters.contains(index) {
          englishCharacters.insert(index)
          if englishCharacters.count == 26 {
            return true
          }
        }
      default:
        continue
      }
    }
    return false
  }
  
  /**
   Convert a string to a Set
   
   - returns: a set of Characters
   */
  func convertToCharacterSet() -> Set<Character> {
    var uniqueCharacters: Set<Character> = []
    for c in self.characters {
      if !uniqueCharacters.contains(c) {
        uniqueCharacters.insert(c)
      }
    }
    return uniqueCharacters
  }
  
  /**
   Check whether or not a string is a palindrome
   
   - returns: boolean value indicate whether or not a string is a palindrome
   */
  func isPalindrome() -> Bool {
    let reversed = String(self.characters.reversed())
    return reversed == self
  }
}

public extension Double {
  func format(_ f: String) -> String {
    return NSString(format: "%\(f)f" as NSString, self) as String
  }
}

// MARK: Functional Class

/**
 *   Python range() like Structure
 *
 *   it will generate a sequence from start to end with step. e.g start 1, end 10, step 2 -> 1, 3, 5, 7, 9
 *   Note: end is exclusive
 */

public struct SRange: Sequence {
  var start: Int = 0
  var end: Int = 0
  var step: Int = 0
  
  public init(start: Int = 0, end: Int, step: Int = 1) {
    self.start = start
    self.end = end
    self.step = step
  }
  
  public func makeIterator() -> RangeGenerator {
    return RangeGenerator(start: start, end: end, step: step)
  }
}

open class RangeGenerator: IteratorProtocol {
  let start: Int
  let end: Int
  let step: Int
  let clockWise: Bool
  
  var stepNum = 0
  
  public init(start: Int, end: Int, step: Int) {
    self.start = start
    self.end = end
    self.step = step
    clockWise = step > 0
  }
  
  open func next() -> Int? {
    if clockWise {
      guard start + stepNum * step < end else { return nil }
      let ret = start + step * stepNum
      stepNum += 1
      return ret
    } else {
      guard start + stepNum * step > end else { return nil }
      let ret = start + step * stepNum
      stepNum += 1
      return ret
    }
  }
}

// MARK: Data Structures

/**
 *  Queue FIFO, this implementation could achieve amortised O(1) enqueue and dequeue
 */

public struct Queue<Element> {
  fileprivate var left: [Element]
  fileprivate var right: [Element]
  
  public init() {
    left = []
    right = []
  }
  
  /**
   Enqueue an element into Queue
   
   - parameter element: the element that need to be enqueued
   */
  public mutating func enqueue(_ element: Element) {
    right.append(element)
  }
  
  public mutating func dequeue() -> Element? {
    guard !(left.isEmpty && right.isEmpty) else { return nil }
    if left.isEmpty {
      left = right.reversed()
      right.removeAll(keepingCapacity: true)
    }
    return left.removeLast()
  }
  
  public func isEmpty() -> Bool {
    return left.isEmpty && right.isEmpty
  }
}

extension Queue: Collection {
  /// Returns the position immediately after the given index.
  ///
  /// - Parameter i: A valid index of the collection. `i` must be less than
  ///   `endIndex`.
  /// - Returns: The index value immediately after `i`.
  public func index(after i: Int) -> Int {
    guard i < endIndex - 1 else {
      fatalError("Index out of bounds")
    }
    return i + 1
  }

  public var startIndex: Int { return 0 }
  public var endIndex: Int { return left.count + right.count }
  
  public subscript(idx: Int) -> Element {
    guard idx < endIndex else { fatalError("Index out of bounds") }
    if idx < left.endIndex {
      return left[left.count - (idx + 1)]
    } else {
      return right[idx - left.count]
    }
  }
}

/**
 *  ListNode
 *  This class is used by Leetcode.
 */

open class ListNode {
  open var val: Int
  open var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

/**
 *   DoubleListNode Class
 */
open class DoubleListNode<T>{
  var value: T
  var next: DoubleListNode?
  // NOTE: weak here to prevent retain cycle.
  weak var pre: DoubleListNode?
  
  public typealias Element = T
  
  public init(_ value: T) {
    self.value = value
  }
  
  /**
   Reverse a DoubleListNode return a new DoubleListNode with reversed order
   
   - parameter node: node to be reversed
   
   - returns: a brand new node with reversed elements
   */
  open static func reverse(_ node: DoubleListNode?) -> DoubleListNode? {
    var prev: DoubleListNode? = nil
    var head = node
    while head != nil {
      let newHead = DoubleListNode(head!.value)
      let tmp = head!.next
      newHead.next = prev
      prev = newHead
      head = tmp
    }
    return prev
  }
  
}

extension DoubleListNode: CustomStringConvertible {
  public var description:String {
    if let next = next {
      return "Node(v:\(value))->\(next)"
    } else {
      return "Node(v:\(value))->NULL"
    }
  }
}

/**
 *   Linked List Class
 */

open class LinkedList<T> {

  public typealias Node = DoubleListNode<T>

  /// head of this linked list.
  fileprivate var head: Node?
  
  /// tail of this linked list.
  fileprivate var tail: Node?
  
  /// The count of elements in this linked list.
  open var count: Int = 0
  
  /// Whether or not this LinkedList is empty.
  open var isEmpty: Bool {
    return head == nil
  }
  
  /// The first element of this Linked list.
  open var first: Node? {
    return head
  }
  
  /// The last element of this linked list.
  open var last: Node? {
    return tail
  }
  
  /// Insert an element at The head of this double linked list.
  open func insertAtHead(_ value: T) {
    let newHead = DoubleListNode(value)
    if let node = head {
      node.pre = newHead
      newHead.next = node
      head = newHead
    } else {
      head = newHead
      tail = newHead
    }
    count += 1
  }
  
  /// Append an element at the tail of this double linked list.
  open func append(_ value: T) {
    let newTail = DoubleListNode(value)
    if let node = tail {
      node.next = newTail
      newTail.pre = node
      tail = newTail
    } else {
      head = newTail
      tail = newTail
    }
    count += 1
  }
  
  /// Return the node at specified index.
  open func nodeAtIndex(_ index: Int) -> Node? {
    if index >= 0 {
      var node = head
      var i = index
      while node != nil {
        if i == 0 {
          return node
        }
        i -= 1
        node = node?.next
      }
    }
    return nil
  }
  
  open subscript(index: Int) -> T {
    assert(index < count)
    let node = nodeAtIndex(index)
    return node!.value
  }
  
  /// Helper function return the element before and after that index.
  open func beforAndAfterElementAt(_ index: Int) -> (Node?, Node?) {
    assert(index < count)
    var searchCount = index
    var currentNode = head
    while searchCount > 0 {
      currentNode = currentNode?.next
      searchCount -= 1
    }
    return (currentNode?.pre, currentNode?.next)
  }
  
  /// Remove element at `index`, return the element's value.
  open func removeElementAt(_ index: Int) {
    assert(index < count)
    let (nodeBefore, nodeAfter) = beforAndAfterElementAt(index)
    switch (nodeBefore, nodeAfter) {
    case (.none, .some(let node)):
      node.pre = nil
      head = node
    case (.some(let node), .none):
      node.next = nil
      tail = node
    case (.some(let beforeNode), .some(let afterNode)):
      beforeNode.next = afterNode
      afterNode.pre = beforeNode
    case (.none, .none):
      head = nil
      tail = nil
    }
    count -= 1
  }
  
  /// Remove last element of this linked list
  open func removeLastElement() {
    guard count > 0 else {
      return
    }
    if let preNode = tail?.pre {
      preNode.next = nil
      tail = preNode
    } else {
      head = nil
      tail = nil
    }
    count -= 1
  }
  
  /// Remove first element of this linked list
  open func removeFirstElement() {
    guard count > 0 else {
      return
    }
    if let nextNode = head?.next {
      nextNode.pre = nil
      head = nextNode
    } else {
      head = nil
      tail = nil
    }
    count -= 1
  }
  
  /// Cool, notice how the `T`, `C` generic type works, and where clause.
  class func generateLinkedListFromSequence<C: Collection>(_ sequence: C) ->
    LinkedList<T> where C.Iterator.Element == T {
    let result = LinkedList<T>()
    for element in sequence {
      result.append(element)
    }
    return result
  }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    if let headDescription = head?.description {
      return headDescription
    } else {
      return "Empty"
    }
  }
}

enum List<Element> {
  case end
  indirect case node(Element, next: List<Element>)
}

extension List {
  func cons(_ element: Element) -> List {
    return .node(element, next:self)
  }
}

/**
 *  A LIFO stack type with constant-time push and pop operations
 */
protocol StackType {
  associatedtype Element
  
  mutating func push(_ x: Element)
  
  mutating func pop() -> Element?
  
  func isEmpty() -> Bool
}

extension Array: StackType {
  mutating func push(_ x: Element) {
    self.append(x)
  }
  
  mutating func pop() -> Element? {
    if self.count == 0 {
      return nil
    }
    return self.popLast()
  }
  
  func isEmpty() -> Bool {
    return self.isEmpty
  }
}

extension List: StackType {
  mutating func push(_ x: Element) {
    self = self.cons(x)
  }
  
  mutating func pop() -> Element? {
    switch self {
    case .end:
      return nil
    case let .node(element, nx):
      self = nx
      return element
    }
  }
  
  func isEmpty() -> Bool {
    switch self {
    case .end:
      return true
    case .node:
      return false
    }
  }
}

extension List: Sequence {
  func makeIterator() -> AnyIterator<Element> {
    var current: List<Element> = self
    return AnyIterator {
      return current.pop()
    }
  }
}

//
//  AVLTree.swift
//  AVLTree
//
//  Swift port of immutable AVLTree I implemented with Stephan Partzsch
//
//  Original ObjC implementation: https://github.com/StephanPartzsch/AVLTree
//
//  Copyright (c) 2014 Maxim Zaks. All rights reserved.
//

public func ||<T>(optional : Optional<T>, defaultValue : T) -> T {
  if let value = optional {
    return value
  }
  return defaultValue
}

public func +<T>(node : AVLNode<T>, newValue : T) -> AVLNode<T> {
  var newLeft : AVLNode<T>? = node.left
  var newRight : AVLNode<T>? = node.right
  if(newValue < node.value) {
    if let left = node.left {
      newLeft = left + newValue
    } else {
      newLeft = AVLNode(newValue)
    }
  } else if(newValue > node.value) {
    if let right = node.right {
      newRight = right + newValue
    } else {
      newRight = AVLNode(newValue)
    }
  } else {
    return node
  }
  
  let newRoot = AVLNode(value: node.value, left: newLeft, right: newRight)
  
  return newRoot.fixBalance()
}

public func-<T>(node: AVLNode<T>?, value : T) -> AVLNode<T>? {
  return node?.remove(value).result
}

public func +<T>(tree : AVLTree<T>, newValue : T) {
  if let root = tree.root {
    tree.root = root + newValue
  } else {
    tree.root = AVLNode(newValue)
  }
  tree.count = tree.root!.count
}

public func-<T>(tree: AVLTree<T>, value : T) {
  if let root = tree.root {
    tree.root = root - value
    tree.count = tree.root?.count ?? 0
  }
}

open class AVLTree<T: Comparable> {
  var root: AVLNode<T>?
  var count: UInt = 0
}

public extension AVLTree {
  
  convenience init(value: T) {
    self.init()
    root = AVLNode(value)
    count = root!.count
  }
}


public final class AVLNode<T : Comparable> {
  typealias Element = T
  let left : AVLNode<Element>?
  let right : AVLNode<Element>?
  public let count : UInt
  let depth : UInt
  let balance : Int
  let value : Element!
  
  public convenience init(_ value : T){
    self.init(value: value, left: nil, right: nil)
  }
  
  public init(value: T, left: AVLNode<T>?, right: AVLNode<T>?) {
    self.value = value
    self.left = left
    self.right = right
    self.balance = Int(left?.depth ?? 0) - Int(right?.depth ?? 0)
    self.count = 1 + (left?.count ?? 0) + (right?.count ?? 0)
    self.depth = 1 + Swift.max(left?.depth ?? 0, right?.depth ?? 0)
  }
  
  public func contains(_ value: T) -> Bool {
    if self.value == value {
      return true
    } else if self.value < value {
      if right?.contains(value) == true {
        return true
      }
    } else {
      if left?.contains(value) == true {
        return true
      }
    }
    return false
  }
  
  func fixBalance() -> AVLNode<Element> {
    if abs(balance) < 2 {
      return self
    }
    
    if balance == 2 {
      let leftBalance = left!.balance
      if leftBalance == 1 || leftBalance == 0 {
        return rotateToRight()
      }
      
      if leftBalance == -1 {
        let newLeft = left!.rotateToLeft()
        let newRoot = AVLNode(value: value, left: newLeft, right: right)
        return newRoot.rotateToRight()
      }
    }
    
    if balance == -2 {
      let rightBalance = right!.balance
      if rightBalance == -1 || rightBalance == 0 {
        return rotateToLeft()
      }
      
      if rightBalance == 1 {
        let newRight = right!.rotateToRight()
        let newRoot = AVLNode(value: value, left: left, right: newRight)
        return newRoot.rotateToLeft()
      }
    }
    fatalError("Tree too unbalanced")
  }
  
  func remove(_ value : Element) -> (result: AVLNode<Element>?, foundFlag :Bool){
    if value < self.value {
      
      let removeResult = left?.remove(value)
      
      if removeResult == nil || removeResult!.foundFlag == false {
        // Not found, so nothing changed
        return (self, false)
      }
      
      let newRoot = AVLNode(value: self.value, left: removeResult!.result, right: right).fixBalance()
      
      return (newRoot, true)
    }
    
    if value > self.value {
      let removeResult = right?.remove(value)
      
      if removeResult == nil || removeResult!.foundFlag == false {
        // Not found, so nothing changed
        return (self, false)
      }
      
      let newRoot = AVLNode(value: self.value, left: left, right: removeResult!.result).fixBalance()
      
      return (newRoot, true)
    }
    
    //found it
    return (removeRoot(), true)
  }
  
  func removeMin()-> (min : AVLNode<Element>, result : AVLNode<Element>?){
    if left == nil {
      //We are the minimum:
      return (self, right)
    } else {
      //Go down:
      let (min, newLeft) = left!.removeMin()
      let newRoot = AVLNode(value: value, left: newLeft, right: right)
      
      return (min, newRoot.fixBalance())
    }
  }
  
  func removeMax()-> (max : AVLNode<Element>, result : AVLNode<Element>?){
    if right == nil {
      //We are the max:
      return (self, left)
    } else {
      //Go down:
      let (max, newRight) = right!.removeMax()
      let newRoot = AVLNode(value: value, left: left, right: newRight)
      
      return (max, newRoot.fixBalance())
    }
  }
  
  func removeRoot() -> AVLNode<Element>? {
    if left == nil {
      return right
    }
    
    if right == nil {
      return left
    }
    
    //Neither are empty:
    if left!.count < right!.count {
      // LeftNode has fewer, so promote from RightNode to minimize depth
      let (min, newRight) = right!.removeMin()
      let newRoot = AVLNode(value: min.value, left: left, right: newRight)
      
      return newRoot.fixBalance()
    }
    else
    {
      let (max, newLeft) = left!.removeMax()
      let newRoot = AVLNode(value: max.value, left: newLeft, right: right)
      
      return newRoot.fixBalance()
    }
  }
  
  func rotateToRight() -> AVLNode<Element> {
    let newRight = AVLNode(value: value, left: left!.right, right: right)
    return AVLNode(value: left!.value, left: left!.left, right: newRight)
  }
  
  func rotateToLeft() -> AVLNode<Element> {
    let newLeft = AVLNode(value: value, left: left, right: right!.left)
    return AVLNode(value: right!.value, left: newLeft, right: right!.right)
  }
}

extension AVLNode : CustomStringConvertible, CustomDebugStringConvertible {
  public var description : String {
    get {
      let empty = "_"
      return "(\(value) \(left?.description || empty) \(right?.description || empty))"
    }
  }
  
  public var debugDescription : String {
    get {
      return self.description
    }
  }
}


//  SequenceType implementation is based on following blog post:
//  http://www.spazcosoft.com/posts/data-structures-in-swift-part-1-wow-thats-an-unstable-compiler/

extension AVLNode : Sequence {
  public func makeIterator() -> AnyIterator<T> {
    
    var stack : [AVLNode<Element>] = []
    var current : AVLNode<Element>? = self
    
    return AnyIterator {
      while(stack.count != 0 || current != nil){
        if(current != nil) {
          stack.append(current!)
          current = current!.left
        } else {
          let retval = stack.removeLast();
          current = retval.right
          return retval.value
        }
      }
      
      return nil
    }
  }
}

struct ReversedSequenceOfAvlNode<T : Comparable> : Sequence {
  let node : AVLNode<T>
  func makeIterator() -> AnyIterator<T> {
    
    var stack : [AVLNode<T>] = []
    var current : AVLNode<T>? = node
    
    return AnyIterator {
      while(stack.count != 0 || current != nil){
        if(current != nil) {
          stack.append(current!)
          current = current!.right
        } else {
          let retval = stack.removeLast();
          current = retval.left
          return retval.value
        }
      }
      
      return nil
    }
  }
}

extension AVLNode {
  public var reversed : AnySequence<T> {
    get {
      return AnySequence(ReversedSequenceOfAvlNode(node: self))
    }
  }
}


/**
 * BinaryIndexedTree: a data structure used for storing frequencies and manipulating cumulative frequency.
 *
 * e.g to search a frequency from n..m O(n), by using BIT we could fast get this result O(lgn)
 *
 */

open class BinaryIndexedTree {
  // we ignore 0th element, since it's no sence to count non-exist element's occurence.
  
  // size is actually the maximum count that could occur.
  let size: Int
  var tree: [Int]
  
  
  public init(size: Int) {
    self.size = size
    tree = Array(repeating: 0, count: size+1)
  }
  
  /**
   * Update BIT at pos with some val
   *
   * - parameter pos: Index to BIT array, usually means number for item quantity
   * - parameter val: this index's frequency's change
   */
  open func update(_ pos: Int, val: Int) {
    guard pos > 0 else { return }
    var localPos = pos
    while localPos <= size {
      tree[localPos] += val
      localPos += (Int(localPos)&Int(-localPos))
    }
  }
  
  /**
   * Query BIT the cumulative frequencies for index pos
   *
   * - parameter pos: Index to query, usually means number for item quantity
   */
  open func query(_ localPos: Int) -> Int {
    var pos = localPos
    var sum = 0
    while pos > 0 {
      sum += tree[pos]
      pos -= (Int(pos)&Int(-pos))
    }
    return sum
  }
}

/**
 *  A heap is a type of tree data structure with 2 characteristics:
 *  1. Parent nodes are either greater or less than each of their children (called max heaps and min heaps respectively)
 *  2. Only the top item is accessible (greatest or smallest)
 *
 *  This results in a data structure that stores n item in O(n) space. Both insertion and deletion take O(lg(n)) time (amortized)
 */
protocol Heap {
  associatedtype Value
  mutating func insert(_ value: Value)
  mutating func remove() -> Value?
  func peak() -> Value?
  var count: Int { get }
  var isEmpty: Bool { get }
}

public struct MaxHeap<T: Comparable> : Heap {
  public static func arrayIsMaxHeap(_ array: [T]) -> Bool {
    if array.count == 0 {
      return false
    }
    for i in 0..<array.count {
      let leftChild = i * 2 + 1
      let rightChild = i * 2 + 2
      if leftChild < array.endIndex {
        if array[leftChild] > array[i] {
          return false
        }
      }
      if rightChild < array.endIndex {
        if array[rightChild] > array[i] {
          return false
        }
      }
    }
    return true
  }

  typealias Value = T
  
  /**     10
   *   7      5
   *  1 2    3
   *  Will be represented as [10, 7, 5, 1, 2, 3]
   */
  fileprivate var mem: [T]
  
  init() {
    mem = [T]()
  }
  
  init(array: [T]) {
    self.init()
    mem.reserveCapacity(array.count)
    for value in array {
      insert(value)
    }
  }
  
  public var isEmpty: Bool {
    return mem.isEmpty
  }
  
  public var count: Int {
    return mem.count
  }
  
  public mutating func insert(_ value: T) {
    mem.append(value)
    shiftUp(index: mem.count - 1)
  }
  
  public mutating func remove() -> T? {
    if self.isEmpty {
      return nil
    }
    
    let retVal = mem[0]
    (mem[0], mem[count-1]) = (mem[count-1], mem[0])
    mem.removeLast()
    
    shiftDown()
    
    return retVal
  }
  
  public func peak() -> T? {
    guard self.count > 0 else { return nil }
    return mem[0]
  }
  
  fileprivate func parentIndex(childIndex: Int) -> Int {
    return (childIndex - 1)/2
  }
  
  fileprivate func firstChildIndex(_ index: Int) -> Int {
    return index * 2 + 1
  }
  
  @inline(__always) fileprivate func validIndex(_ index: Int) -> Bool {
    return index < mem.endIndex
  }
  
  fileprivate mutating func shiftUp(index: Int) {
    var currentIndex = index
    var currentParentIndex = parentIndex(childIndex: index)
    while currentIndex > 0 && mem[currentIndex]>mem[currentParentIndex] {
      (mem[currentParentIndex], mem[currentIndex]) = (mem[currentIndex], mem[currentParentIndex])
      currentIndex = currentParentIndex
      currentParentIndex = parentIndex(childIndex: currentIndex)
    }
  }
  
  fileprivate mutating func shiftDown(index: Int = 0) {
    var parentIndex = index
    var leftChildIndex = firstChildIndex(parentIndex)
    
    //Loop preconditions: parentIndex and left child index are set
    while (validIndex(leftChildIndex)) {
      let rightChildIndex = leftChildIndex + 1
      var highestIndex = leftChildIndex
      
      if validIndex(rightChildIndex) {
        let left = mem[leftChildIndex]
        let right = mem[rightChildIndex]
        highestIndex = (left > right) ? leftChildIndex : rightChildIndex
      }
      
      //If the child > parent, swap them
      let parent = mem[parentIndex]
      let biggerChild = mem[highestIndex]
      if biggerChild < parent {
        return
      }
      
      //Swap parent with child
      (mem[parentIndex], mem[highestIndex]) = (mem[highestIndex], mem[parentIndex])
      
      // update parentIndex and leftChildIndex
      parentIndex = highestIndex
      leftChildIndex = firstChildIndex(parentIndex)
    }
  }
}


// TODO: Priority Queue
